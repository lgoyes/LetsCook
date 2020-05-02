//
//  APIContentType.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

public enum APIContentType: String {
    case json = "application/json"
    case formURLEncoded = "application/x-www-form-urlencoded"
    case jpeg = "image/jpeg"
    case png = "image/png"
    case anyImage = "image/*"
    case pdf = "application/pdf"
    case anyDocument = "application/*"
    case any = "*/*"
    case headerName = "Content-Type"
}
