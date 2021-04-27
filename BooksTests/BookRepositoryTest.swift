//
//  BookRepositoryTest.swift
//  BooksTests
//
//  Created by joaquin bozzalla on 27/04/2021.
//

import XCTest
@testable import WBooks

class BookRepositoryTest: XCTestCase {

    var sut: BookRepositoryType!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BookRepository()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetBooksRequest() {
        let promise = expectation(description: "books Received")
        
        let onSuccess = { (books: [Book]) in
            promise.fulfill()
        }
        let onError = { (error: Error) in
            XCTAssertNotNil(error, "Error in books request: \(error)")
        }
        
        sut.fetchBooks(onSuccess: onSuccess, onError: onError)
        wait(for: [promise], timeout: 20)
    }
    
}
