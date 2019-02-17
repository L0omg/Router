//
//  Executor.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation
import UIKit

protocol ExecutorType {
    associatedtype Response
    func execute(response: Response)
}

struct AnyExcutor<Response>: ExecutorType {
    typealias Executor = (Response) -> Void
    private let exe: Executor
    
    init(_ exe: @escaping Executor) {
        self.exe = exe
    }
    
    func execute(response: Response) {
        exe(response)
    }
}

struct DefaultExecutor<Response: ResponseType>: ExecutorType {
    func execute(response: Response) {
        response.prefersExecutor().execute(response: response)
    }
}

struct ActionExecutor: ExecutorType {
    typealias Response = ActionResponse
    func execute(response: Response) {
        response.response()
    }
}

struct PushExecutor<Response: ResponseType>: ExecutorType where Response.Response == UIViewController {
    let animated: Bool
    init(animated: Bool = true) {
        self.animated = animated
    }
    
    func execute(response: Response) {
        (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)?.pushViewController(response.response, animated: animated)
    }
}

struct PresentExecutor<Response: ResponseType>: ExecutorType where Response.Response == UIViewController {
    typealias Completion = () -> Void
    let animated: Bool
    let completion: Completion?
    init(animated: Bool = true, completion: Completion? = nil) {
        self.animated = animated
        self.completion = completion
    }
    
    func execute(response: Response) {
        UIApplication.shared.keyWindow?.rootViewController?.present(response.response, animated: animated, completion: completion)
    }
}

struct ResetRootExecuter<Response: ResponseType>: ExecutorType where Response.Response == UIViewController {
    let wrapper: UINavigationController?
    init(_ wrapper: UINavigationController? = nil) {
        self.wrapper = wrapper
    }
    func execute(response: Response) {
        if let wrapper = wrapper {
            wrapper.pushViewController(response.response, animated: false)
        }
        UIApplication.shared.keyWindow?.rootViewController = wrapper ?? response.response
    }
}
