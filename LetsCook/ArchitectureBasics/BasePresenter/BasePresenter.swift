//
//  BasePresenter.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

class BasePresenter<ViewType, ViewController: AnyObject>: BasePresenterType {
    typealias View = ViewType
    
    private unowned var viewController: ViewController!
    
    var view: ViewType! {
        return viewController as? ViewType
    }

    public func bind<BindableView>(view: BindableView)
    where BindableView: BaseViewType {
        self.viewController = view as? ViewController
    }
    
    func unbind() {
        self.viewController = nil
    }

    func viewDidLoad() {
        // This method can be overriden
    }

    func viewWillAppear() {
        // This method can be overriden
    }

    func viewDidAppear() {
        // This method can be overriden
    }

    func viewWillDisappear() {
        // This method can be overriden
    }

    func viewDidDisappear() {
        // This method can be overriden
    }
    
    func handleException(_ error: Error) {
        print(error.localizedDescription)
    }
}
