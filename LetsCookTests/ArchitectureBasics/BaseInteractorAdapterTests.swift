//
//  BaseInteractorAdapterTests.swift
//  LetsCookTests
//
//  Created by Luis David Goyes Garces on 5/3/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import XCTest
import RxSwift
@testable import LetsCook

final class TestBaseInteractorAdapter<Response, Params>: BaseInteractorAdapter<Response, Params, TestBaseInteractorAdapter> {
    
}

final class BaseInteractorAdapterTests: XCTestCase {
    
    var sut: TestBaseInteractorAdapter<Any, Any>!
    
    override func setUp() {
        super.setUp()
        sut = TestBaseInteractorAdapter<Any, Any>()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testParams_givenParamsAttribute_setParamsToAdaptedInteractor() {
        let dummyParams = 1
        sut.params(dummyParams)
        
        XCTAssertEqual(sut.baseInteractor.paramsAttribute! as! Int, dummyParams)
    }
    
    func testParams_givenParamsAttribute_returnAdaptedInteractor() {
        let dummyParams = 1
        let chainedInteractor = sut.params(dummyParams)
        
        XCTAssert(chainedInteractor === sut)
    }
    
    func testOnFinallyCallback_givenOnFinallyCallback_setOnFinallyToAdaptedInteractor() {
        let expectation = XCTestExpectation()
        let onFinallyCallback: (() -> Void) = {
            expectation.fulfill()
        }
        sut.onFinally(onFinallyCallback)
        sut.baseInteractor.onFinallyCallback?()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testOnFinallyCallback_givenOnFinallyCallback_returnAdaptedInteractor() {
        let onFinallyCallback: (() -> Void) = {}
        let chainedInteractor = sut.onFinally(onFinallyCallback)
        
        XCTAssert(chainedInteractor === sut)
    }
}
