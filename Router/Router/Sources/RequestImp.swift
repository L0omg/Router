//
//  RequestImp.swift
//  Router
//
//  Created by LYP on 2019/3/29.
//  Copyright © 2019年 Hebao. All rights reserved.
//  主要用于多模块开发时，解除各个模块之间的依赖，将Request的实现延迟到运行时再进行绑定，使各个模块可以独立编译

import Foundation

public protocol ViewControllerRequestImp {
    static func send<T: RequestType>(_ path: T, _ completionHandler:(ViewControllerResponse) -> Void) where T.Response == ViewControllerResponse
}

public protocol ActionRequestImp {
    static func send<T: RequestType>(_ path: T, _ completionHandler:(ActionResponse) -> Void) where T.Response == ViewControllerResponse
}
