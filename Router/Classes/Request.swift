//
//  Request.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import Foundation

protocol RequestType {
    associatedtype Response: ResponseType
    func send(_ completionHandler:(Response) -> Void)
}
