//
//  URL.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//
import Foundation

extension URL {
    static var backendURL: String {
        if let url = Bundle.main.infoDictionary?["API_URL"] as? String {
            return "https://" + url
        }
        return ""
    }
    
    static var books: URL {
        URL(string: backendURL + "/books")!
    }

    static func comments(bookId: Int) -> URL {
        URL(string: backendURL + "/books/\(bookId)/comments")!
    }
    
    static func user(userId: Int) -> URL {
        URL(string: backendURL + "/users/\(userId)")!
    }
    
    static var rents: URL {
        URL(string: backendURL + "/rents")!
    }
    
    static func rentsBy(userId: Int) -> URL {
        URL(string: backendURL + "/users/\(userId)/rents")!
    }
    
    static func suggestions(userId: Int) -> URL {
        URL(string: backendURL + "/users/\(userId)/suggestions")!
    }
}
