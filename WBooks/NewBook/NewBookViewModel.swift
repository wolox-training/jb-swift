//
//  NewBookViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 19/04/2021.
//

final class NewBookViewModel {
    private let bookRepository: BookRepositoryType
    
    init(bookRepository: BookRepositoryType = BookRepository()) {
        self.bookRepository = bookRepository
    }
    
    func loadBook(book: UnidentifiableBook, onSuccess: @escaping (Book) -> Void, onError: @escaping (Error) -> Void) {
        guard book.isValid() else {
            onError(NewBookViewModelError.invalidBook)
            return
        }
        
        bookRepository.uploadBook(book: book, onSuccess: onSuccess, onError: onError)
    }
    
    func setValidator(textfield: CustomTextfield) {
        let emptyValidator = { (value: String) in return !value.isEmpty }
        textfield.setValidator(emptyValidator)
    }
}

enum NewBookViewModelError: Error {
    case invalidBook
}
