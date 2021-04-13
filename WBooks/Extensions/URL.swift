//
//  URL.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//
import Foundation

extension URL {
    static var books: URL {
        URL(string: "https://ios-training-backend.herokuapp.com/api/v1/books")!
    }
}
