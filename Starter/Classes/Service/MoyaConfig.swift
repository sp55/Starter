//
//  SNMoyaConfig.swift
//  ShowNow
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 apple. All rights reserved.
//
import Foundation
import Moya

// 定义基础域名
let BASEURL = "http://news-at.zhihu.com/api/"
// 定义返回的JSON数据字段
let RESULT_CODE = "flag"      //状态码
let RESULT_MESSAGE = "message"  //错误消息提示


/*  错误情况的提示
 {
 "flag": "0002",
 "msg": "手机号码不能为空",
 "lockerFlag": true
 }
 **/


/**
配置TargetType协议可以一次性处理的参数
- Todo: 根据自己的需要更改，不能统一处理的移除下面的代码，并在DMAPI中实现
**/

public extension TargetType {
    var baseURL: URL {
        return URL(string: "http://app.u17.com/v3/appV3_3/ios/phone/")!
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
}
