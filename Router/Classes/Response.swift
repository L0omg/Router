//
//  Response.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation
import UIKit

protocol ResponseType {
    associatedtype Response
    associatedtype Executor: ExecutorType where Executor.Response == Self
    var response: Response { get }
    func prefersExecutor() -> Executor
}

extension UIViewController: ResponseType {
    typealias Response = UIViewController
    //    typealias Executor = PushExecutor
    
    var response: Response { return self }
    func prefersExecutor() -> PushExecutor<UIViewController> {
        return Executor()
    }
}

struct ActionResponse: ResponseType {
    typealias Response = () -> Void
    typealias Executor = ActionExecutor
    
    var response: Response
    func prefersExecutor() -> Executor {
        return Executor()
    }
}
