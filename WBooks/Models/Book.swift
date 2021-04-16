//
//  Book.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

public class Book: Codable {
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
    var status : String

    var isAvailable: Bool {
        return status == bookStatus.available.rawValue
    }
    
    func setAvailable() {
        status = bookStatus.available.rawValue
    }
    
    func setUnavailable() {
        status = bookStatus.unavailable.rawValue
    }
}

enum bookStatus: String {
    case available = "Available"
    case unavailable = "Unvailable"
}
