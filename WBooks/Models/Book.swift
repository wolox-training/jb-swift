//
//  Book.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

class UnidentifiableBook: Codable {
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
    var status : BookStatus = .unavailable
    
    init(title: String, author: String, genre: String, year: String, image: String, status: BookStatus) {
        self.title = title
        self.author = author
        self.genre = genre
        self.year = year
        self.image = image
        self.status = status
    }
    
    func isValid() -> Bool {
        return !(title.isEmpty || author.isEmpty || genre.isEmpty || year.isEmpty)
    }
}

final class Book: UnidentifiableBook {
    let id: Int
    
    private enum CodingKeys: String, CodingKey { case id }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        try super.init(from: decoder)
    }

    var isAvailable: Bool {
        return status == BookStatus.available
    }
    
    func setAvailable() {
        status = BookStatus.available
    }
    
    func setUnavailable() {
        status = BookStatus.unavailable
    }
    
    func setInYourHands() {
        status = BookStatus.inYourHands
    }
}

enum BookStatus: String, Codable {
    case available = "Available"
    case unavailable = "Unavailable"
    case inYourHands = "InYourHands"
}
