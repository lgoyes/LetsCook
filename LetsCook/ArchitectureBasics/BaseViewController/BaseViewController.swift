//
//  BaseViewController.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

class BaseViewController<PresenterType>: UIViewController, BaseViewType {

    var presenter: PresenterType!
    
    init(presenter: PresenterType) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    deinit {
        self.presenter = nil
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        (presenter as? BasePresenterLifeCycleNotifiable)?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (presenter as? BasePresenterLifeCycleNotifiable)?.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        (presenter as? BasePresenterLifeCycleNotifiable)?.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        (presenter as? BasePresenterLifeCycleNotifiable)?.viewWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        (presenter as? BasePresenterLifeCycleNotifiable)?.viewDidDisappear()
    }
}
