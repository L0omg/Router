//
//  LoginRouterImp.swift
//  LoginModule
//
//  Created by LYP on 2019/3/29.
//  Copyright © 2019年 Hebao. All rights reserved.
//

import Foundation
import Router
import LoginRouter

public class LoginRouterImp: ViewControllerRequestImp {
    public static func send<T>(_ path: T, _ completionHandler: (ViewControllerResponse) -> Void) where T : RequestType, T.Response == ViewControllerResponse {
        guard let router = path as? LoginRouter else { return }
        switch router {
        case .login(phoneNumber: let phoneNumber):
            let loginVc = LoginViewController()
            loginVc.phoneNumber = phoneNumber
            completionHandler(loginVc)
        }
    }
    
    public static func register() {
        LoginRouter.imp = self
    }
}
