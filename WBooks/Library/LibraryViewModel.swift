//
//  MainMenuViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

final class LibraryViewModel {
    private let books: [Book]
    
    var numberOfBooks: Int {
        return books.count
    }
    
    func createBookCellViewModel(for bookIndex: Int) -> BookCellViewModel {
        return BookCellViewModel(book: books[bookIndex])
    }
    
    init() {
        books = [
            Book(title: "A little bird told me", author: "Timothy Cross", imageName: ""),
            Book(title: "When the Doveeeeeeeeeees Disappeared", author: "Timothy Cross", imageName: nil),
            Book(title: "The Best Book in the World", author: "Peter Sjernstrom", imageName: "img_book3"),
            Book(title: "Be Creative", author: "Tony Alcazar", imageName: "img_book4"),
            Book(title: "Redesign the Web", author: "Liliana Castilla", imageName: "img_book5"),
        ]
    }
}
