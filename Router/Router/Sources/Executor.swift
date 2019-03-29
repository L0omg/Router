//
//  Executor.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation
import UIKit

public protocol ExecutorType {
    associatedtype Response
    func execute(response: Response)
}

public struct AnyExcutor<Response>: ExecutorType {
    public typealias Executor = (Response) -> Void
    private let exe: Executor
    
    public init(_ exe: @escaping Executor) {
        self.exe = exe
    }
    
    public func execute(response: Response) {
        exe(response)
    }
}

public struct DefaultExecutor<Response: ResponseType>: ExecutorType {
    public init() {}
    public func execute(response: Response) {
        response.prefersExecutor().execute(response: response)
    }
}

public struct ActionExecutor: ExecutorType {
    public typealias Response = ActionResponse
    public init() {}
    public func execute(response: Response) {
        response.response()
    }
}

public struct PushExecutor<Response: ResponseType>: ExecutorType where Response.Response == UIViewController {
    public let animated: Bool
    public init(animated: Bool = true) {
        self.animated = animated
    }
    
    public func execute(response: Response) {
        (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)?.pushViewController(response.response, animated: animated)
    }
}

public struct PresentExecutor<Response: ResponseType>: ExecutorType where Response.Response == UIViewController {
    public typealias Completion = () -> Void
    public let animated: Bool
    public let completion: Completion?
    public init(animated: Bool = true, completion: Completion? = nil) {
        self.animated = animated
        self.completion = completion
    }
    
    public func execute(response: Response) {
        UIApplication.shared.keyWindow?.rootViewController?.present(response.response, animated: animated, completion: completion)
    }
}

public struct ResetRootExecuter<Response: ResponseType>: ExecutorType where Response.Response == UIViewController {
    public let wrapper: UINavigationController?
    public init(_ wrapper: UINavigationController? = nil) {
        self.wrapper = wrapper
    }
    public func execute(response: Response) {
        if let wrapper = wrapper {
            wrapper.pushViewController(response.response, animated: false)
        }
        UIApplication.shared.keyWindow?.rootViewController = wrapper ?? response.response
    }
}
