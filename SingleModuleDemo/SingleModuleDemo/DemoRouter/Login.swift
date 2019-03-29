//
//  Login.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation
import UIKit
import Router

enum LoginRouter {
    case login(phoneNumber: String?)
}

extension LoginRouter: RequestType {
    func send(_ completionHandler: (UIViewController) -> Void) {
        switch self {
        case .login(phoneNumber: let phoneNumber):
            let loginVc = LoginViewController()
            loginVc.phoneNumber = phoneNumber
            completionHandler(loginVc)
        }
    }
}
