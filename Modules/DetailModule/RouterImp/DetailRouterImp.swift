//
//  DetailRouterImp.swift
//  DetailModule
//
//  Created by LYP on 2019/3/29.
//  Copyright © 2019年 Hebao. All rights reserved.
//

import Foundation
import Router
import DetailRouter

public class DetailRouterImp: ViewControllerRequestImp {
    public static func send<T>(_ path: T, _ completionHandler: (ViewControllerResponse) -> Void) where T : RequestType, T.Response == ViewControllerResponse {
        guard let router = path as? DetailRouter else { return }
        switch router {
        case .detail(id: let id):
            let detailVc = DetailViewController()
            detailVc.id = id
            completionHandler(detailVc)
        }
    }
    
    public static func register() {
        DetailRouter.imp = self
    }
}
