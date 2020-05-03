//
//  SingleInteractorTests.swift
//  LetsCookTests
//
//  Created by Luis David Goyes Garces on 5/3/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import XCTest
import RxSwift
@testable import LetsCook

class SingleInteractorSpy: SingleInteractor<Any, Any> {
    
    enum TestError: Error {
        case anyError
    }
    
    var result: Result<Any, TestError>?
    var paramsSpyCallback: ((Any?)->Void)?
    
    override func buildUseCase(params: Any?) -> Single<Any> {
        self.paramsSpyCallback?(params)
        return Single<Any>.create { (emitter) -> Disposable in
            switch self.result! {
            case .success(let value):
                emitter(.success(value))
            case .failure(let error):
                emitter(.error(error))
            }
            return Disposables.create()
        }
    }
}

class SingleInteractorTests: XCTestCase {
    
    var sut: SingleInteractorSpy!
    
    override func setUp() {
        super.setUp()
        sut = SingleInteractorSpy()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testExecute_whenFailureOccurs_invokeOnFinallyCallback(){
        // Given
        let dummyResponse = SingleInteractorSpy.TestError.anyError
        sut.result = .failure(dummyResponse)

        let expectation = XCTestExpectation()
        sut.onFinally {
            expectation.fulfill()
        }
        
        // When
        sut.execute()
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testExecute_whenFailureOccurs_invokeOnErrorCallback(){
        // Given
        let dummyResponse = SingleInteractorSpy.TestError.anyError
        sut.result = .failure(dummyResponse)

        let expectation = XCTestExpectation()
        sut.onError { (error) in
            expectation.fulfill()
        }
        
        // When
        sut.execute()
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testExecute_whenSuccessfulExecutionOccurs_invokeOnFinallyCallback(){
        // Given
        let dummyResponse = 1
        sut.result = .success(dummyResponse)

        let expectation = XCTestExpectation()
        sut.onFinally {
            expectation.fulfill()
        }
        
        // When
        sut.execute()
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testExecute_whenSuccessfulExecutionOccurs_invokeOnSuccessCallback(){
        // Given
        let dummyResponse = 1
        sut.result = .success(dummyResponse)

        let expectation = XCTestExpectation()
        sut.onSuccess { (result) in
            XCTAssertEqual(result as! Int, dummyResponse)
            expectation.fulfill()
        }
        
        // When
        sut.execute()
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testExecute_whenGivenParams_useParams(){
        // Given
        let dummyParams = 1
        let dummyResponse = 1
        sut.params(dummyParams)
        sut.result = .success(dummyResponse)

        let expectation = XCTestExpectation()
        sut.paramsSpyCallback = { params in
            XCTAssertEqual(params as! Int, dummyParams)
            expectation.fulfill()
        }
        
        // When
        sut.execute()
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
}
