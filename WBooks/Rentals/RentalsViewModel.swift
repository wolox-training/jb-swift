//
//  RentalsViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 20/04/2021.
//

class RentalsViewModel: BooksTableViewModel {
    private let rentsRepository: RentRepositoryType
    private let booksRepository: BookRepositoryType
    private var rents: [Rent] = []
    
    init(rentsRepository: RentRepositoryType = RentRepository(), booksRepository: BookRepositoryType = BookRepository()) {
        self.rentsRepository = rentsRepository
        self.booksRepository = booksRepository
    }
    
    override func fetchData(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { [weak self] (rents: [Rent]) in
            self?.rents = rents
            self?.fetchRentedBooks(onSuccess: onSuccess, onError: onError)
        }
        rentsRepository.rentsBy(userId: 9, onSuccess: onFetchSuccess, onError: onError)
    }
    
    func fetchRentedBooks(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { [weak self] (books: [Book]) in
            // Filter only rented books
            for rent in self?.rents ?? [] {
                if let book = books.first(where: { book in book.id == rent.book_id }) {
                    book.setInYourHands()
                    self?.books.append(book)
                }
            }
            onSuccess()
        }
        booksRepository.fetchBooks(onSuccess: onFetchSuccess, onError: onError)
    }
}
