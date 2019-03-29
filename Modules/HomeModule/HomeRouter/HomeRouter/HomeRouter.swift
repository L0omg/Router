//
//  HomeRouter.swift
//  MultiModuleDemo
//
//  Created by LYP on 2019/3/29.
//  Copyright © 2019年 Hebao. All rights reserved.
//

import Foundation
import UIKit
import Router

public enum HomeRouter {
    case home

    public static var imp: ViewControllerRequestImp.Type?
}

extension HomeRouter: RequestType {
    public func send(_ completionHandler: (ViewControllerResponse) -> Void) {
        HomeRouter.imp?.send(self, completionHandler)
    }
}
