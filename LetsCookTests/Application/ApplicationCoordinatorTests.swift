//
//  ApplicationCoordinatorTests.swift
//  LetsCookTests
//
//  Created by Luis David Goyes Garces on 5/3/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import XCTest
@testable import LetsCook

final class ApplicationCoordinatorTests: XCTestCase {

    var router: RouterSpy!
    var sut: ApplicationCoordinator!

    override func setUp() {
        super.setUp()
        self.router = RouterSpy()
        self.sut = ApplicationCoordinator(router: self.router)
    }

    override func tearDown() {
        sut = nil
        router = nil
        super.tearDown()
    }

    func testInit_subCoordinatorsCollectionMustBeEmpty() {
        XCTAssert(sut.subCoordinators.isEmpty)
    }

    func testPresentRecipeList_whenPresentingRecipeList_addRecipeListCoordinatorToSubCoordinatorsCollection() {
        // When
        sut.presentRecipeList()

        // Then
        XCTAssert(sut.subCoordinators.count == 1)
        XCTAssert(sut.subCoordinators.first! is RecipeListCoordinator)
    }
    
    func testPresentRecipeDetail_whenPresentingRecipeDetail_addRecipeDetailCoordinatorToSubCoordinatorsCollection() {
        // Given
        let dummyRecipeId = 1
        
        // When
        sut.presentRecipeDetail(withId: dummyRecipeId)
        
        // Then
        XCTAssert(sut.subCoordinators.count == 1)
        XCTAssert(sut.subCoordinators.first! is RecipeDetailCoordinator)
    }
    
    func testCreateDetailCoordinator_shouldSetRestClient() {
        let detailCoordinator = sut.createDetailCoordinator()
        XCTAssert(detailCoordinator.restClient === sut.restClient)
    }
    
    func testCreateListCoordinator_shouldSetRestClient() {
        let listCoordinator = sut.createListCoordinator()
        XCTAssert(listCoordinator.restClient === sut.restClient)
    }
    
    func testCreateListCoordinator_shouldSetDelegateAsSelf() {
        let listCoordinator = sut.createListCoordinator()
        if let delegate = listCoordinator.delegate {
            XCTAssert(delegate === sut)
        } else {
            XCTFail("Delegate can't be nil")
        }
    }
    
    func testOnRecipeDetailRequested_shouldAddRecipeDetailCoordinatorToSubCoordinatorsCollection() {
        // Given
        let dummyRecipeId = 1
        
        // When
        sut.onRecipeDetailRequested(for: dummyRecipeId)
        
        // Then
        XCTAssert(sut.subCoordinators.count == 1)
        XCTAssert(sut.subCoordinators.first! is RecipeDetailCoordinator)
    }
    
    func testFetchOrCreateDetailCoordinator_ifThereWasNotOtherDetailCoordinator_createDetailCoordinator() {
        // When
        let newCoordinator = sut.fetchOrCreateDetailCoordinator()
        
        // Then
        XCTAssert(sut.subCoordinators.count == 0)
        XCTAssertNotNil(newCoordinator)
    }
    
    func testFetchOrCreateDetailCoordinator_ifThereWasAnotherDetailCoordinator_fetchTheSameDetailCoordinator() {
        // Given
        let dummyRecipeId = 1
        sut.presentRecipeDetail(withId: dummyRecipeId)
        let expectedRecipeDetailCoordinator = sut.subCoordinators.first! as! RecipeDetailCoordinator
        
        // When
        let newCoordinator = sut.fetchOrCreateDetailCoordinator()
        
        // Then
        XCTAssert(sut.subCoordinators.count == 1)
        XCTAssertNotNil(newCoordinator === expectedRecipeDetailCoordinator)
    }
    
    func testFetchOrCreateListCoordinator_ifThereWasNotOtherListCoordinator_createListCoordinator() {
        // When
        let newCoordinator = sut.fetchOrCreateListCoordinator()
        
        // Then
        XCTAssert(sut.subCoordinators.count == 0)
        XCTAssertNotNil(newCoordinator)
    }
    
    func testFetchOrCreateListCoordinator_ifThereWasAnotherListCoordinator_fetchTheSameListCoordinator() {
        // Given
        sut.presentRecipeList()
        let expectedRecipeListCoordinator = sut.subCoordinators.first! as! RecipeListCoordinator
        
        // When
        let newCoordinator = sut.fetchOrCreateListCoordinator()
        
        // Then
        XCTAssert(sut.subCoordinators.count == 1)
        XCTAssertNotNil(newCoordinator === expectedRecipeListCoordinator)
    }
}
