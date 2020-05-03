//
//  SingleInteractor.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import RxSwift

class SingleInteractor<Response, Parameters>: BaseInteractorAdapter<Response, Parameters, SingleInteractor> {
    
    public override init() {
        // Intentionally left in blank
    }

    override public func execute() {
        self.baseInteractor.disposable = buildUseCase(params: self.baseInteractor.paramsAttribute)
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .subscribe(
                onSuccess: { [weak self] (response) in
                    self?.baseInteractor.onNextCallback?(response)
                    self?.baseInteractor.onFinallyCallback?()
                },
                onError: { [weak self] (error) in
                    self?.baseInteractor.onErrorCallback?(error)
                    self?.baseInteractor.onFinallyCallback?()
                })
    }

    open func buildUseCase(params: Parameters?) -> Single<Response> {
        fatalError("SingleInteractor's buildUseCase method MUST be overriden")
    }

    @discardableResult
    public func onSuccess(_ onSuccessCallback: ((Response) -> Void)?) -> Self {
        self.baseInteractor.onNextCallback = onSuccessCallback
        return self
    }
}
