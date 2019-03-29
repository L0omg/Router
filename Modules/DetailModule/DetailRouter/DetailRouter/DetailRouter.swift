//
//  DetailRouter.swift
//  MultiModuleDemo
//
//  Created by LYP on 2019/3/29.
//  Copyright © 2019年 Hebao. All rights reserved.
//

import Foundation
import UIKit
import Router

public enum DetailRouter {
    case detail(id: Int)

    public static var imp: ViewControllerRequestImp.Type?
}

extension DetailRouter: RequestType {
    public func send(_ completionHandler: (ViewControllerResponse) -> Void) {
        DetailRouter.imp?.send(self, completionHandler)
    }
}
