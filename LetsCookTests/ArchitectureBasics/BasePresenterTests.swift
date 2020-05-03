//
//  BasePresenterTests.swift
//  LetsCookTests
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import XCTest
@testable import LetsCook

final class TestableBasePresenter: BasePresenter<BaseViewSpyType, BaseViewControllerSpy<TestableBasePresenter>> {
    
}

final class BasePresenterTests: XCTestCase {
    
    var view: BaseViewControllerSpy<TestableBasePresenter>!
    var sut: TestableBasePresenter!
    
    override func setUp() {
        super.setUp()
        sut = TestableBasePresenter()
        view = BaseViewControllerSpy<TestableBasePresenter>(presenter: sut)
        sut.bind(view: view)
    }

    override func tearDown() {
        view = nil
        sut = nil
        super.tearDown()
    }
    
    func testBind_givenView_setsView() {
        sut.bind(view: view)
        XCTAssert(sut.view === view)
    }
    
    func testUnbind_setsViewToNil() {
        sut.bind(view: view)
        
        sut.unbind()
        
        XCTAssert(sut.view === nil)
    }
}
