//
//  ClientType.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation
import RxSwift

public protocol RESTClientType: AnyObject {
    func request<Response: Decodable>(_ endpoint: Endpoint<Response>) -> Single<Response>
}
