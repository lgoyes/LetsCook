//
//  NetworkError.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case unexpectedConnectionError
    case urlResponseWasNil
    case httpURLResponseCastFailure
    case dataWasNil
}
