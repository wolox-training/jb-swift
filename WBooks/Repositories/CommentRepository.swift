//
//  CommentRepository.swift
//  WBooks
//
//  Created by joaquin bozzalla on 15/04/2021.
//

import Alamofire

protocol CommentRepositoryType {
    func fetchComments(bookId: Int, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void)
}

final class CommentRepository: CommentRepositoryType {
    
    func fetchComments(bookId: Int, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void) {
        AF
            .request(URL.comments(bookId: bookId), method: .get)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    guard let JSONComments = try? JSONSerialization.data(withJSONObject: value, options: []), let comments = try? JSONDecoder().decode([Comment].self, from: JSONComments) else {
                        onError(CommentError.decodeError)
                        return
                    }
                    
                    onSuccess(comments)
                case .failure(let error):
                    onError(error)
                }
            })
    }
}

enum CommentError: Error {
    case decodeError
}
