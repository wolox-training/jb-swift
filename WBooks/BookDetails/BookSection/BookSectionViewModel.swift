//
//  BookSectionViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 14/04/2021.
//

import UIKit

final class BookSectionViewModel {
    private var book: Book
    private let rentRepository: RentRepository

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
    var imageURL: String {
        return book.image
    }
    var isBookAvailable: Bool {
        return book.isAvailable
    }
    
    var status: BookStatus {
        book.status
    }
    
    init(book: Book, rentRepository: RentRepository = RentRepository()) {
        self.book = book
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
