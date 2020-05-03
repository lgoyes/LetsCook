//
//  Interactor.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import RxSwift

protocol Interactor: AnyObject {
    func execute()
}

class BaseInteractor<Response, Parameters> {

    var disposable: Disposable?

    var paramsAttribute: Parameters?

    var onNextCallback: ((Response) -> Void)?

    var onCompletedCallback: (() -> Void)?

    var onErrorCallback: ((Error) -> Void)?

    var onFinallyCallback: (() -> Void)?

    deinit {
        disposable?.dispose()
    }
}

class BaseInteractorAdapter<Response, Parameters, ChainType>: Interactor {

    let baseInteractor = BaseInteractor<Response, Parameters>()
    
    public init() {
        // Intentionally left in blank
    }

    @discardableResult
    public func params(_ paramsAttribute: Parameters?) -> ChainType {
        self.baseInteractor.paramsAttribute = paramsAttribute
        return self as! ChainType
    }

    @discardableResult
    public func onFinally(_ onFinallyCallback: (() -> Void)?) -> ChainType {
        self.baseInteractor.onFinallyCallback = onFinallyCallback
        return self as! ChainType
    }

    @discardableResult
    public func onError(_ onErrorCallback: ((Error) -> Void)?) -> ChainType {
        self.baseInteractor.onErrorCallback = onErrorCallback
        return self as! ChainType
    }

    public func execute() {
        // Intentionally left in blank
    }
}
