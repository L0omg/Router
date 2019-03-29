//
//  Response.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation
import UIKit

public protocol ResponseType {
    associatedtype Response
    associatedtype Executor: ExecutorType where Executor.Response == Self
    var response: Response { get }
    func prefersExecutor() -> Executor
}

extension UIViewController: ResponseType {
    public typealias Response = UIViewController
    //    typealias Executor = PushExecutor
    
    public var response: Response { return self }
    public func prefersExecutor() -> PushExecutor<UIViewController> {
        return Executor()
    }
}

public struct ActionResponse: ResponseType {
    public typealias Response = () -> Void
    public typealias Executor = ActionExecutor
    
    public var response: Response
    public func prefersExecutor() -> Executor {
        return Executor()
    }
}
