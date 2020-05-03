//
//  BaseInteractorTests.swift
//  LetsCookTests
//
//  Created by Luis David Goyes Garces on 5/3/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import XCTest
import RxSwift
@testable import LetsCook

final class BaseInteractorTest: XCTestCase {
    
    struct Constants {
        enum TestError: Error {
            case dummyError
        }
    }
    
    var sut: BaseInteractor<Any, Any>!
    
    override func setUp() {
        super.setUp()
        sut = BaseInteractor<Any, Any>()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInit_givenDisposable_setsDisposable() {
        let disposable = Disposables.create()
        sut.disposable = disposable
        XCTAssertNotNil(sut.disposable)
    }
    
    func testInit_givenParams_setsParams() {
        let params = 1
        sut.paramsAttribute = params
        XCTAssertNotNil(sut.paramsAttribute)
    }
    
    func testInit_givenOnNextCallback_setsOnNextCallback() {
        let dummyOnNextValue = ""
        let expectation = XCTestExpectation()
        let onNextCallback: ((Any) -> Void) = { value in
            XCTAssertEqual(dummyOnNextValue, value as! String)
            expectation.fulfill()
        }
        
        sut.onNextCallback = onNextCallback
        
        XCTAssertNotNil(sut.onNextCallback)
        sut.onNextCallback?(dummyOnNextValue)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testInit_givenOnCompleteCallback_setsOnCompleteCallback() {
        let expectation = XCTestExpectation()
        let onCompleteCallback: (() -> Void) = {
            expectation.fulfill()
        }
        
        sut.onCompletedCallback = onCompleteCallback
        
        XCTAssertNotNil(sut.onCompletedCallback)
        sut.onCompletedCallback?()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testInit_givenOnErrorCallback_setsOnErrorCallback() {
        let expectation = XCTestExpectation()
        let onErrorCallback: ((Error) -> Void) = { error in
            expectation.fulfill()
        }
        
        sut.onErrorCallback = onErrorCallback
        
        XCTAssertNotNil(sut.onErrorCallback)
        sut.onErrorCallback?(Constants.TestError.dummyError)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testInit_givenOnFinallyCallback_setsOnFinallyCallback() {
        let expectation = XCTestExpectation()
        let onFinallyCallback: (() -> Void) = {
            expectation.fulfill()
        }
        
        sut.onFinallyCallback = onFinallyCallback
        
        XCTAssertNotNil(sut.onFinallyCallback)
        sut.onFinallyCallback?()
        wait(for: [expectation], timeout: 1.0)
    }
}
