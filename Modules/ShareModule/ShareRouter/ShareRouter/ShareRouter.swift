//
//  ShareRouter.swift
//  ShareRouter
//
//  Created by LYP on 2019/3/29.
//  Copyright © 2019年 Hebao. All rights reserved.
//

import Foundation
import UIKit
import Router

public enum ShareRouter {
    case sayHi
    case showAlert(title: String, message: String?)
}

extension ShareRouter: RequestType {
    public func send(_ completionHandler: (ActionResponse) -> Void) {
        switch self {
        case .sayHi:
            completionHandler(ActionResponse{
                print("Hi")
            })
        case let .showAlert(title: title, message: msg):
            completionHandler(ActionResponse{
                let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
                let confirm = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(confirm)
                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
            })
        }
    }
}
