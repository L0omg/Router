//
//  Hook.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation

protocol HookType {
    associatedtype Request
    associatedtype Response
    func shouldStart(_ path: Request) -> Bool
    func beginRouter(_ path: Request)
    func shouldHandler(_ path: Request, response: Response) -> Bool
    func finishRouter(_ path: Request, response: Response, finish: Bool /*false:被中断*/)
}

extension HookType {
    func shouldStart(_ path: Request) -> Bool { return true }
    func beginRouter(_ path: Request) {}
    func shouldHandler(_ path: Request, response: Response) -> Bool { return true }
    func finishRouter(_ path: Request, response: Response, finish: Bool /*false:被中断*/) {}
}

struct EmptyHook<Request, Response>: HookType {}

struct AnyHook<Request, Response> {
    typealias ShouldStart = (Request) -> Bool
    typealias BeginRouter = (Request) -> Void
    typealias ShouldHandler = (Request, Response) -> Bool
    typealias FinishRouter = (Request, Response, Bool) -> Void
    
    let shouldStart: ShouldStart?
    let beginRouter: BeginRouter?
    let shouldHandler: ShouldHandler?
    let finishRouter: FinishRouter?
}

extension AnyHook: HookType {
    func shouldStart(_ path: Request) -> Bool {
        guard let shouldStart = shouldStart else {
            return true
        }
        return shouldStart(path)
    }
    
    func beginRouter(_ path: Request) {
        guard let beginRouter = beginRouter else {
            return
        }
        return beginRouter(path)
    }
    
    func shouldHandler(_ path: Request, response: Response) -> Bool {
        guard let shouldHandler = shouldHandler else {
            return true
        }
        return shouldHandler(path, response)
    }
    
    func finishRouter(_ path: Request, response: Response, finish: Bool) {
        guard let finishRouter = finishRouter else {
            return
        }
        return finishRouter(path, response, finish)
    }
}
