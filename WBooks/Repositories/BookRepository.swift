//
//  BookRepository.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

import Alamofire

protocol BookRepositoryType {
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void)
}

class BookRepository: BookRepositoryType {
    
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        AF
            .request(URL.books, method: .get)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    guard let JSONBooks = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                        onError(BookError.decodeError)
                        return
                    }
                    guard let books = try? JSONDecoder().decode([Book].self, from: JSONBooks) else {
                        onError(BookError.decodeError)
                        return
                    }
                    onSuccess(books)
                case .failure(let error):
                    onError(error)
                }
            })
    }
}

enum BookError: Error {
    case decodeError
}
