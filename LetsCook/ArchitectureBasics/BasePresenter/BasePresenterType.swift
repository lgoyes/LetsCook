//
//  BasePresenterType.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol BasePresenterType: AnyObject, BasePresenterLifeCycleNotifiable {
    associatedtype View
    var view: View! { get }

    func bind<BindableView: BaseViewType>(view: BindableView)
    func unbind()
    func handleException(_ error: Error)
}
