//
//  Action.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation
import Router

enum ActionRouter {
    case sayHello
}

extension ActionRouter: RequestType {
    func send(_ completionHandler: (ActionResponse) -> Void) {
        switch self {
        case .sayHello:
            completionHandler(ActionResponse{
                print("hello world!!!")
            })
        }
    }
}
