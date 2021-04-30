//
//  URLTests.swift
//  BooksTests
//
//  Created by joaquin bozzalla on 27/04/2021.
//

import XCTest
@testable import WBooks

class URLTests: XCTestCase {

    func testGetBooksURL() {
        let url = URL.books
        XCTAssertTrue(url.absoluteString.hasPrefix("https://"), "URL must start with https")
        XCTAssertTrue(url.absoluteString.hasSuffix("/books"), "not valid url")
    }
    
    func testGetComments() {
        let url = URL.comments(bookId: 5)
        XCTAssertTrue(url.absoluteString.hasPrefix("https://"), "URL must start with https")
        XCTAssertTrue(url.absoluteString.hasSuffix("/books/5/comments"), "not valid url")
    }
    
    func testGetUser() {
        let url = URL.user(userId: 9)
        XCTAssertTrue(url.absoluteString.hasPrefix("https://"), "URL must start with https")
        XCTAssertTrue(url.absoluteString.hasSuffix("/users/9"), "not valid url")
    }
    
    func testGetAllRents() {
        let url = URL.rents
        XCTAssertTrue(url.absoluteString.hasPrefix("https://"), "URL must start with https")
        XCTAssertTrue(url.absoluteString.hasSuffix("/rents"), "not valid url")
    }
    
    func testGetRentsByUser() {
        let url = URL.rentsBy(userId: 9)
        XCTAssertTrue(url.absoluteString.hasPrefix("https://"), "URL must start with https")
        XCTAssertTrue(url.absoluteString.hasSuffix("/users/9/rents"), "not valid url")
    }
    
    func testGetSuggestions() {
        let url = URL.suggestions(userId: 9)
        XCTAssertTrue(url.absoluteString.hasPrefix("https://"), "URL must start with https")
        XCTAssertTrue(url.absoluteString.hasSuffix("/users/9/suggestions"), "not valid url")
    }
}
