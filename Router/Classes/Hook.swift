//
//  Hook.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation

public protocol HookType {
    associatedtype Request
    associatedtype Response
    func shouldStart(_ path: Request) -> Bool
    func beginRouter(_ path: Request)
    func shouldHandler(_ path: Request, response: Response) -> Bool
    func finishRouter(_ path: Request, response: Response, finish: Bool /*false:被中断*/)
}

public extension HookType {
    func shouldStart(_ path: Request) -> Bool { return true }
    func beginRouter(_ path: Request) {}
    func shouldHandler(_ path: Request, response: Response) -> Bool { return true }
    func finishRouter(_ path: Request, response: Response, finish: Bool /*false:被中断*/) {}
}

public struct EmptyHook<Request, Response>: HookType {}

public struct AnyHook<Request, Response> {
    public typealias ShouldStart = (Request) -> Bool
    public typealias BeginRouter = (Request) -> Void
    public typealias ShouldHandler = (Request, Response) -> Bool
    public typealias FinishRouter = (Request, Response, Bool) -> Void
    
    public let shouldStart: ShouldStart?
    public let beginRouter: BeginRouter?
    public let shouldHandler: ShouldHandler?
    public let finishRouter: FinishRouter?
}

extension AnyHook: HookType {
    public func shouldStart(_ path: Request) -> Bool {
        guard let shouldStart = shouldStart else {
            return true
        }
        return shouldStart(path)
    }
    
    public func beginRouter(_ path: Request) {
        guard let beginRouter = beginRouter else {
            return
        }
        return beginRouter(path)
    }
    
    public func shouldHandler(_ path: Request, response: Response) -> Bool {
        guard let shouldHandler = shouldHandler else {
            return true
        }
        return shouldHandler(path, response)
    }
    
    public func finishRouter(_ path: Request, response: Response, finish: Bool) {
        guard let finishRouter = finishRouter else {
            return
        }
        return finishRouter(path, response, finish)
    }
}
