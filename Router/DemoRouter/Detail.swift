//
//  Detail.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation
import UIKit

enum DetailRouter {
    case detail(id: Int)
}

extension DetailRouter: RequestType {
    func send(_ completionHandler: (UIViewController) -> Void) {
        switch self {
        case .detail(id: let id):
            let detailVc = DetailViewController()
            detailVc.id = id
            completionHandler(detailVc)
        }
    }
}
