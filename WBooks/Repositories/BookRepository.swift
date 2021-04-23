//
//  BookRepository.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

import Alamofire

protocol BookRepositoryType {
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void)
    func uploadBook(book: UnidentifiableBook, onSuccess: @escaping (Book) -> Void, onError: @escaping (Error) -> Void)
}

final class BookRepository: BookRepositoryType {
    
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        AF
            .request(URL.books, method: .get)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    guard let JSONBooks = try? JSONSerialization.data(withJSONObject: value, options: []),
                          let books = try? JSONDecoder().decode([Book].self, from: JSONBooks)
                    else {
                        onError(BookError.decodeError)
                        return
                    }
                    onSuccess(books)
                case .failure(let error):
                    onError(error)
                }
            })
    }
    
    func uploadBook(book: UnidentifiableBook, onSuccess: @escaping (Book) -> Void, onError: @escaping (Error) -> Void) {
        AF
            .request(URL.books, method: .post, parameters: book, encoder: JSONParameterEncoder.default)
            .responseJSON(
                completionHandler: { response in
                    switch response.result {
                    case .success(let value):
                        guard let JSONResponse = try? JSONSerialization.data(withJSONObject: value, options: []), let response = try? JSONDecoder().decode(Book.self, from: JSONResponse) else {
                            onError(BookError.decodeError)
                            return
                        }
                        
                        onSuccess(response)
                    case .failure(let error):
                        onError(error)
                    }
                }
            )
    }
}

enum BookError: Error {
    case decodeError
}
