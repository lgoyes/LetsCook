//
//  Endpoint.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

public struct Endpoint<Response>: Equatable {
    public let method: HTTPMethod
    public let path: String
    public let parameters: [String: Any]?
    public let contentType: APIContentType

    public init(
        path: String,
        parameters: [String: Any]?,
        method: HTTPMethod = .get,
        contentType: APIContentType = .json) {
        self.method = method
        self.path = path
        self.parameters = parameters
        self.contentType = contentType
    }

    public static func == (lhs: Endpoint<Response>, rhs: Endpoint<Response>) -> Bool {
        var parametersAreEqual = false
        if let lhsParameters = lhs.parameters, let rhsParameters = rhs.parameters {
            let lhsDictionary = NSDictionary(dictionary: lhsParameters)
            parametersAreEqual = lhsDictionary.isEqual(to: rhsParameters)
        } else if lhs.parameters == nil && rhs.parameters == nil {
            parametersAreEqual = true
        }

        return lhs.method == rhs.method &&
            lhs.path == rhs.path &&
            lhs.contentType == rhs.contentType &&
            parametersAreEqual
    }
}
