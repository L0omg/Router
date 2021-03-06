//
//  Router.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation
import UIKit

public struct Router {
    public func router<T: RequestType, E: ExecutorType, H: HookType>(to path: T, executor: E, hook: H) where E.Response == T.Response, H.Request == T, H.Response == T.Response {
        guard hook.shouldStart(path) else {
            return
        }
        hook.beginRouter(path)
        path.send {
            guard hook.shouldHandler(path, response: $0) else {
                hook.finishRouter(path, response: $0, finish: false)
                return
            }
            executor.execute(response: $0)
            hook.finishRouter(path, response: $0, finish: true)
        }
    }
    
    public static let `default` = Router()
    public init() {}
}

public extension Router {
    public func router<T: RequestType>(to path: T) {
        router(to: path, executor:DefaultExecutor())
    }
    
    public func router<T: RequestType, E: ExecutorType>(to path: T, executor: E) where E.Response == T.Response {
        router(to: path, executor: executor, hook: EmptyHook())
    }
    
    public func router<T: RequestType, H: HookType>(to path: T, hook: H) where H.Request == T, H.Response == T.Response {
        router(to: path, executor: DefaultExecutor(), hook: hook)
    }
    
    public func router<T: RequestType>(to path: T, executor: @escaping (T.Response) -> Void) {
        router(to: path, executor: AnyExcutor(executor))
    }
    
    public func router<T: RequestType>(to path: T,
                                      shouldStart: AnyHook<T, T.Response>.ShouldStart? = nil,
                                      beginRouter: AnyHook<T, T.Response>.BeginRouter? = nil,
                                      shouldHandler: AnyHook<T, T.Response>.ShouldHandler? = nil,
                                      finishRouter: AnyHook<T, T.Response>.FinishRouter? = nil) {
        router(to: path, hook: AnyHook(shouldStart: shouldStart,
                                             beginRouter: beginRouter,
                                             shouldHandler: shouldHandler,
                                             finishRouter: finishRouter))
    }
}

//MARK: ViewController
public extension Router {
    public func push<T: RequestType>(to path: T, animated: Bool = true) where T.Response.Response == UIViewController {
        router(to: path, executor: PushExecutor<T.Response>(animated: animated))
    }
    
    public func present<T: RequestType>(to path: T, animated: Bool = true, completion: PresentExecutor<T.Response>.Completion? = nil) where T.Response.Response == UIViewController {
        router(to: path, executor: PresentExecutor<T.Response>(animated: animated, completion: completion))
    }
    
    public func resetRoot<T: RequestType>(to path: T, wrapper: UINavigationController? = nil) where T.Response.Response == UIViewController  {
        router(to: path, executor: ResetRootExecuter(wrapper))
    }
}
