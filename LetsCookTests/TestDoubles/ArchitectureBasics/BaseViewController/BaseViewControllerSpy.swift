//
//  BaseViewControllerSpy.swift
//  LetsCookTests
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation
@testable import LetsCook

protocol BaseViewSpyType: BaseViewType {
    
}

protocol ViewControllerLifeCycleTestable {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

final class BaseViewControllerSpy<PresenterType>: ViewControllerLifeCycleTestable, BaseViewSpyType {
    
    var presenter: PresenterType
    init(presenter: PresenterType) {
        self.presenter = presenter
    }
    
    func viewDidLoad() {
        (self.presenter as? BasePresenterLifeCycleNotifiable)?.viewDidLoad()
    }
    
    func viewWillAppear() {
        (self.presenter as? BasePresenterLifeCycleNotifiable)?.viewWillAppear()
    }
    
    func viewDidAppear() {
        (self.presenter as? BasePresenterLifeCycleNotifiable)?.viewDidAppear()
    }
    
    func viewWillDisappear() {
        (self.presenter as? BasePresenterLifeCycleNotifiable)?.viewWillDisappear()
    }
    
    func viewDidDisappear() {
        (self.presenter as? BasePresenterLifeCycleNotifiable)?.viewDidDisappear()
    }
}
