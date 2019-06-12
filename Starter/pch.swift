//
//  ShowNowPch.swift
//  ShowNow
//
//  Created by apple on 2019/6/6.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

let ScreenWidth: CGFloat = UIScreen.main.bounds.size.width
let ScreenHeight: CGFloat = UIScreen.main.bounds.size.height

func iPhone5() ->Bool {
    return (ScreenWidth==320&&ScreenHeight==568.0)
}

func iPhoneX() -> Bool {
    return ((ScreenWidth==375.0&&ScreenHeight==812.0)||(ScreenWidth==414.0&&ScreenHeight==896.0))
}


//状态栏默认高度
let kStatusBarHeight:CGFloat = (iPhoneX() ? 44.0 : 20.0)
//导航栏默认高度
let kNavBarHeight:CGFloat = 44.0
//Tabbar默认高度
let kTabBarHeight:CGFloat = (iPhoneX() ? 83.0 : 49.0)
let kiOSVersion:String = UIDevice.current.systemVersion         /* iOS系统版本 */


func RGBA(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat) ->UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)}


/* app版本  以及设备系统版本 */
let infoDictionary   = Bundle.main.infoDictionary
let kAppName: String? = infoDictionary!["CFBundleDisplayName"] as? String        /* App名称 */
let kAppVersion: String?  = infoDictionary!["CFBundleShortVersionString"] as? String /* App版本号 */
let kAppBuildVersion: String? = infoDictionary!["CFBundleVersion"] as? String            /* Appbuild版本号 */
let kAppBundleId: String? = infoDictionary!["CFBundleIdentifier"] as? String                 /* app bundleId */




