//
//  HomeRouterImp.swift
//  HomeModule
//
//  Created by LYP on 2019/3/29.
//  Copyright © 2019年 Hebao. All rights reserved.
//

import Foundation
import Router
import HomeRouter

public class HomeRouterImp: ViewControllerRequestImp {
    public static func send<T>(_ path: T, _ completionHandler: (ViewControllerResponse) -> Void) where T : RequestType, T.Response == ViewControllerResponse {
        guard let router = path as? HomeRouter else { return }
        switch router {
        case .home:
            completionHandler(HomeViewController())
        }
    }
    
    public static func register() {
        HomeRouter.imp = self
    }
}
