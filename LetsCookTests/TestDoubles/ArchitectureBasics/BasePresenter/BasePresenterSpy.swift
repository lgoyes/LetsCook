//
//  BasePresenterSpy.swift
//  LetsCookTests
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation
@testable import LetsCook

protocol BasePresenterSpyType {
    
}

final class BasePresenterSpy<ViewType, ViewController: AnyObject>: BasePresenterSpyType, BasePresenterType {
    
    // MARK: - Attributes
    private unowned var sutViewController: ViewController!
    
    var view: ViewType! {
        return sutViewController as? ViewType
    }
    
    func bind<BindableView>(view: BindableView) where BindableView : BaseViewType {
        self.sutViewController = view as? ViewController
    }
    
    func unbind() {
        self.sutViewController = nil
    }
    
    func handleException(_ error: Error) {
        fatalError("Not yet implemented")
    }
    
    func viewDidLoad() {
        fatalError("Not yet implemented")
    }
    
    func viewWillAppear() {
        fatalError("Not yet implemented")
    }
    
    func viewDidAppear() {
        fatalError("Not yet implemented")
    }
    
    func viewWillDisappear() {
        fatalError("Not yet implemented")
    }
    
    func viewDidDisappear() {
        fatalError("Not yet implemented")
    }
}
