//
//  LibraryViewModelTest.swift
//  BooksTests
//
//  Created by joaquin bozzalla on 27/04/2021.
//

import XCTest
@testable import WBooks

class MockBookRepository: BookRepositoryType {
    let bookDataJson = """
                    {
                        "image": "http://wolox-training.s3.amazonaws.com/uploads/content.jpeg",
                        "title": "The Girl on the Train",
                        "id": 1,
                        "author": "Paula Hawkins",
                        "year": "2015",
                        "status": "Unavailable",
                        "genre": "suspense"
                    }
                    """
    
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        do {
            let decoder = JSONDecoder()
            let book = try decoder.decode(Book.self, from: bookDataJson.data(using: .utf8)!)
            onSuccess([book])
        } catch {
            onError(BookError.decodeError)
        }
    }
    
    func uploadBook(book: UnidentifiableBook, onSuccess: @escaping (Book) -> Void, onError: @escaping (Error) -> Void) {
        do {
            let decoder = JSONDecoder()
            let book = try decoder.decode(Book.self, from: bookDataJson.data(using: .utf8)!)
            onSuccess(book)
        } catch {
            onError(BookError.decodeError)
        }
    }
}

class LibraryViewModelTest: XCTestCase {

    var sut: LibraryViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LibraryViewModel(bookRepository: MockBookRepository())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testFakeFetchBooks() {
        let promise = expectation(description: "Fake books received")
        let onSuccess = {
            promise.fulfill()
        }
        let onError = { (error: Error) in
            XCTAssertNil(error, "Error in fake books request: \(error)")
        }
        
        sut.fetchData(onSuccess: onSuccess, onError: onError)
        wait(for: [promise], timeout: 1)
    }
}
