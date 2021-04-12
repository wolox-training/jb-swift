//
//  MainMenuViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

final class LibraryViewModel {
    private let _books: [Book];
    
    var numberOfBooks: Int {
        return _books.count
    }
    
    func createBookCellViewModel(for bookIndex: Int) -> BookCellViewModel {
        return BookCellViewModel(book: _books[bookIndex])
    }
    
    init() {
        _books = [
            Book(title: "A little bird told me", author: "Timothy Cross", imageName: "img_book1"),
            Book(title: "When the Doveeeeeeeeeees Disappeared", author: "Timothy Cross", imageName: "img_book2"),
            Book(title: "The Best Book in the World", author: "Peter Sjernstrom", imageName: "img_book3"),
            Book(title: "Be Creative", author: "Tony Alcazar", imageName: "img_book4"),
            Book(title: "Redesign the Web", author: "Liliana Castilla", imageName: "img_book5"),
        ]
    }
}
