//
//  HTTPManager.swift
//  ShowNow
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import SwiftyJSON
import HandyJSON

// 超时时长
private var requestTimeOut:Double = 30
//成功数据的回调
typealias successCallback = ((String) -> (Void))
//失败的回调
typealias failedCallback = ((String) -> (Void))


///网络请求的基本设置,这里可以拿到是具体的哪个网络请求，可以在这里做一些设置
private let myEndpointClosure = { (target: TargetType) -> Endpoint in
    ///这里把endpoint重新构造一遍主要为了解决网络请求地址里面含有? 时无法解析的bug https://github.com/Moya/Moya/issues/1198
    let url = target.baseURL.absoluteString + target.path
    var task = target.task

    var endpoint = Endpoint (
        url: url,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
        method: target.method,
        task: task,
        httpHeaderFields: target.headers
    )
    requestTimeOut = 30//每次请求都会调用endpointClosure 到这里设置超时时长 也可单独每个接口设置
    return endpoint
}


///网络请求的设置
private let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        //设置请求时长
        request.timeoutInterval = requestTimeOut
        // 打印请求参数
        if let requestData = request.httpBody {
            print("\(request.url!)"+"\n"+"\(request.httpMethod ?? "")"+"发送参数"+"\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
        }else{
            print("\(request.url!)"+"\(String(describing: request.httpMethod))")
        }
        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}


// NetworkActivityPlugin插件用来监听网络请求，界面上做相应的展示
private let networkPlugin = NetworkActivityPlugin.init { (changeType, targetType) in
    print("networkPlugin \(changeType)")
    //targetType 是当前请求的基本信息
    switch(changeType){
    case .began:
        print("开始请求网络")
    case .ended:
        print("结束")
    }
}

/// 网络请求
public class HTTPManager {
    static let shared = HTTPManager()
    private init(){}
    
    // 需要知道成功、失败回调的网络请求   像结束下拉刷新各种情况都要判断
    func NetWorkRequest<T:TargetType>(target:T, success: @escaping successCallback , failed:failedCallback?) {
        //先判断网络是否有链接 没有的话直接返回--代码略
        if !isNetworkConnect{
            print("提示用户网络似乎出现了问题")
            return
        }
        //网络请求发送的核心初始化方法，创建网络请求对象
        let Provider = MoyaProvider<T>(endpointClosure: myEndpointClosure, requestClosure: requestClosure, plugins: [networkPlugin], trackInflights: false)
        //loading显示
        Provider.request(target) { (result) in
            //loading消失
            switch result {
            case let .success(response):
                do {
                    let jsonData = try JSON(data: response.data)
                    print("请求成功之后"+"\(jsonData)")
                    success(String(data: response.data, encoding: String.Encoding.utf8)!)
                } catch {
                }
            case let .failure(error):
                guard let error = error as? CustomStringConvertible else {
                    //网络连接失败，提示用户
                    print("网络连接失败")
                    break
                }
            }
        }
    }
}



// 基于Alamofire,网络是否连接
var isNetworkConnect: Bool {
    get{
        let network = NetworkReachabilityManager()
        return network?.isReachable ?? true //无返回就默认网络已连接
    }
}
