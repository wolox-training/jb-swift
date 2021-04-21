//
//  Book.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

class Book: Codable {
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
    var status : BookStatus

    var isAvailable: Bool {
        return status == BookStatus.available
    }
    
    func setAvailable() {
        status = BookStatus.available
    }
    
    func setUnavailable() {
        status = BookStatus.unavailable
    }
}

enum BookStatus: String, Codable {
    case available = "Available"
    case unavailable = "Unvailable"
}
