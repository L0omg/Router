//
//  Home.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation
import UIKit
import Router

enum HomeRouter {
    case home
}

extension HomeRouter: RequestType {
    func send(_ completionHandler: (UIViewController) -> Void) {
        switch self {
        case .home:
            completionHandler(HomeViewController())
        }
    }
}
