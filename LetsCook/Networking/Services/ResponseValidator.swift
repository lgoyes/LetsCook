//
//  ResponseValidator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

final class ResponseValidator {
    static func validateResponse(statusCode: Int, responseError: Error?) throws {
        switch statusCode {
        case 200:
            break;
        default:
            throw NetworkError.unexpectedConnectionError
        }
    }
}
