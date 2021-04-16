//
//  URL.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//
import Foundation

extension URL {
    static let backendURL = "https://ios-training-backend.herokuapp.com/api/v1"
    
    static var books: URL {
        URL(string: backendURL + "/books")!
    }
    
    static var rents: URL {
        URL(string: backendURL + "/rents")!
    }
    
    static func comments(bookId: Int) -> URL {
        URL(string: backendURL + "/books/\(bookId)/comments")!
    }
    
    static func user(userId: Int) -> URL {
        URL(string: backendURL + "/users/\(userId)")!
    }
}
