//
//  BookDetailsViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 21/04/2021.
//

final class BookDetailsViewModel {
    private let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    func createBookSectionViewModel() -> BookSectionViewModel {
        return BookSectionViewModel(book: book)
    }
    
    func createCommentsSectionViewModel() -> CommentsSectionViewModel {
        return CommentsSectionViewModel(bookId: book.id)
    }
}
