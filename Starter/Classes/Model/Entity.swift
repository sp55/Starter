//
//  SNEntity.swift
//  ShowNow
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import HandyJSON

class Entity: HandyJSON {
    //用HandyJSON必须要实现这个方法
    var code: Int?
    var data: String?
    required init() {}
}
