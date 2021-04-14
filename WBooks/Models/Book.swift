//
//  Book.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

public struct Book: Codable {
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
    let status : String
    
    public init(from: Decoder) {
        let container = try! from.container(keyedBy: BookKey.self)
        id = try! container.decode(Int.self, forKey: .id)
        title = try! container.decode(String.self, forKey: .title)
        author = try! container.decode(String.self, forKey: .author)
        genre = try! container.decode(String.self, forKey: .genre)
        year = try! container.decode(String.self, forKey: .year)
        image = try! container.decode(String.self, forKey: .image)
        status = try! container.decode(String.self, forKey: .status)
    }
    
    func isAvailable() -> Bool {
        return status == "Available"
    }
}

enum BookKey: String, CodingKey {
    case id = "id"
    case title = "title"
    case author = "author"
    case genre = "genre"
    case year = "year"
    case image = "image"
    case status = "status"
}
