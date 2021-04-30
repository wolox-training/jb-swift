//
//  BooksTests.swift
//  BooksTests
//
//  Created by joaquin bozzalla on 26/04/2021.
//

import XCTest
@testable import WBooks

class BooksTests: XCTestCase {
    
    var sut: Book!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let data = """
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
        let decoder = JSONDecoder()
        sut = try decoder.decode(Book.self, from: data.data(using: .utf8)!)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testBookIsAvailable() {
        sut.status = BookStatus.available
        XCTAssertTrue(sut.isAvailable)
        
        sut.status = BookStatus.unavailable
        XCTAssertFalse(sut.isAvailable)
        
        sut.status = BookStatus.inYourHands
        XCTAssertFalse(sut.isAvailable)
        
    }
    
    func testBookSetAvailable() {
        // Given
        sut.status = BookStatus.unavailable
        // When
        sut.setAvailable()
        // Then
        XCTAssertEqual(sut.status, BookStatus.available, "Book must be available")
    }
    
    func testBookSetUnavailable() {
        // Given
        sut.status = BookStatus.available
        // When
        sut.setUnavailable()
        // Then
        XCTAssertEqual(sut.status, BookStatus.unavailable, "Book must be unavailable")
    }
    
    func testBookSetInYourHands() {
        // Given
        sut.status = BookStatus.available
        // When
        sut.setInYourHands()
        // Then
        XCTAssertEqual(sut.status, BookStatus.inYourHands, "Book must be in your hands")
    }
    
    func testBookIsValid() throws {
        let validBooksJson = """
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
        let bookWithoutNameJson = """
                    {
                        "image": "http://wolox-training.s3.amazonaws.com/uploads/content.jpeg",
                        "title": "",
                        "id": 1,
                        "author": "Paula Hawkins",
                        "year": "2015",
                        "status": "Unavailable",
                        "genre": "suspense"
                    }
                    """
        let bookWithoutAuthorJson = """
                    {
                        "image": "http://wolox-training.s3.amazonaws.com/uploads/content.jpeg",
                        "title": "The Girl on the Train",
                        "id": 1,
                        "author": "",
                        "year": "2015",
                        "status": "Unavailable",
                        "genre": "suspense"
                    }
                    """
        let bookWithoutYearJson = """
                    {
                        "image": "http://wolox-training.s3.amazonaws.com/uploads/content.jpeg",
                        "title": "The Girl on the Train",
                        "id": 1,
                        "author": "Paula Hawkins",
                        "year": "",
                        "status": "Unavailable",
                        "genre": "suspense"
                    }
                    """
        let bookWithoutGenreJson = """
                    {
                        "image": "http://wolox-training.s3.amazonaws.com/uploads/content.jpeg",
                        "title": "The Girl on the Train",
                        "id": 1,
                        "author": "Paula Hawkins",
                        "year": "2015",
                        "status": "Unavailable",
                        "genre": ""
                    }
                    """

        let decoder = JSONDecoder()
        let validBook = try decoder.decode(Book.self, from: validBooksJson.data(using: .utf8)!)
        let bookWithoutName = try decoder.decode(Book.self, from: bookWithoutNameJson.data(using: .utf8)!)
        let bookWithoutAuthor = try decoder.decode(Book.self, from: bookWithoutAuthorJson.data(using: .utf8)!)
        let bookWithoutYear = try decoder.decode(Book.self, from: bookWithoutYearJson.data(using: .utf8)!)
        let bookWithoutGenre = try decoder.decode(Book.self, from: bookWithoutGenreJson.data(using: .utf8)!)
        
        XCTAssertTrue(validBook.isValid(), "Book must be valid")
        XCTAssertFalse(bookWithoutName.isValid(), "Book must not be valid")
        XCTAssertFalse(bookWithoutAuthor.isValid(), "Book must not be valid")
        XCTAssertFalse(bookWithoutYear.isValid(), "Book must not be valid")
        XCTAssertFalse(bookWithoutGenre.isValid(), "Book must not be valid")
    }
}
