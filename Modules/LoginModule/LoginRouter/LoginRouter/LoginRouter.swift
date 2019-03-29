//
//  LoginRouter.swift
//  LoginRouter
//
//  Created by LYP on 2019/3/29.
//  Copyright © 2019年 Hebao. All rights reserved.
//

import Foundation
import UIKit
import Router

public enum LoginRouter {
    case login(phoneNumber: String?)
    
    public static var imp: ViewControllerRequestImp.Type?
}

extension LoginRouter: RequestType {
    public func send(_ completionHandler: (ViewControllerResponse) -> Void) {
        LoginRouter.imp?.send(self, completionHandler)
    }
}
