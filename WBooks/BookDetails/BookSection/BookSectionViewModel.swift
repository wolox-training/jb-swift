//
//  BookSectionViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 14/04/2021.
//

import UIKit

final class BookSectionViewModel {
    private var book: Book
    private let rentRepository: RentRepositoryType

    var title: String {
        return book.title
    }
    var author: String {
        return book.author
    }
    var year: String {
        return book.year
    }
    var genre: String {
        return book.genre
    }
    var bookImage: UIImage?
    var imageURL: String {
        return book.image
    }
    var isBookAvailable: Bool {
        return book.isAvailable
    }
    
    init(book: Book, bookImage: UIImage? = nil, rentRepository: RentRepositoryType = RentRepository()) {
        self.book = book
        self.bookImage = bookImage
        self.rentRepository = rentRepository
    }
    
    func rentBook(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onRentSuccess = { (rentResponse: Rent) in
            self.book.setUnavailable()
            onSuccess()
        }
        rentRepository.rentBook(userId: 9, bookId: book.id, onSuccess: onRentSuccess, onError: onError)
    }
}
