//
//  BaseCoordinatorTests.swift
//  LetsCookTests
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import XCTest
@testable import LetsCook

class BaseCoordinatorTests: XCTestCase {
    
    var router: RouterSpy!
    var sut: BaseCoordinator!

    override func setUp() {
        super.setUp()
        self.router = RouterSpy()
        self.sut = BaseCoordinator(router: self.router)
    }

    override func tearDown() {
        sut = nil
        router = nil
        super.tearDown()
    }
    
    func testInit_givenRouter_setsRouter() {
        XCTAssert(sut.router === router)
    }
    
    func testInit_setsEmptySubCoordinator() {
        XCTAssert(sut.subCoordinators.isEmpty)
    }
    
    func testAddDependency_givenSubCoordinator_appendSubCoordinator() {
        let subCoordinator = BaseCoordinator(router: RouterSpy())
        
        sut.addDependency(subCoordinator)
        
        XCTAssert(sut.subCoordinators.contains(where: { $0 === subCoordinator }))
    }
    
    func testAddDependency_givenRepeatedSubCoordinator_doNOTappendSubCoordinator() {
        let subCoordinator = BaseCoordinator(router: RouterSpy())
        
        sut.addDependency(subCoordinator)
        sut.addDependency(subCoordinator)
        
        XCTAssert(sut.subCoordinators.count == 1)
    }
    
    func testRemoveDependency_givenSubCoordinator_removeSubCoordinator() {
        let subCoordinator = BaseCoordinator(router: RouterSpy())
        sut.subCoordinators.append(subCoordinator)
        
        sut.removeDependency(subCoordinator)
        
        XCTAssert(sut.subCoordinators.filter({ $0 === subCoordinator}).isEmpty)
    }
    
    func testRemoveDependency_givenEmptySubCoordinators_doNotDoAnything() {
        let subCoordinator = BaseCoordinator(router: RouterSpy())
        sut.removeDependency(subCoordinator)
        
        XCTAssert(sut.subCoordinators.filter({ $0 === subCoordinator}).isEmpty)
    }
    
    func testRemoveDependency_whenTryingToRemoveNil_doNotDoAnything() {
        let subCoordinator = BaseCoordinator(router: RouterSpy())
        sut.subCoordinators.append(subCoordinator)
        
        sut.removeDependency(nil)
        
        XCTAssert(sut.subCoordinators.count == 1)
    }
    
    func testStart_whenExecuted_doNothing() {
        sut.start()
    }
    
    func testToPresent_whenExecuted_Ru() {
        let expectation = XCTestExpectation()
        router.toPresentCallback = {
            expectation.fulfill()
        }
        
        let viewControllerToBePresented = sut.toPresent()
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssert(viewControllerToBePresented is UINavigationController)
    }
}
