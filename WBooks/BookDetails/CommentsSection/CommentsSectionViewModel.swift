//
//  CommentsSectionViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 15/04/2021.
//

import Foundation

final class CommentsSectionViewModel {
    private let bookId: Int
    private var comments: [Comment] = []
    private let commentsRepository = CommentRepository()
    private let userRepository = UserRepository()
    
    init(bookId: Int) {
        self.bookId = bookId
    }
    
    var numberOfComments: Int {
        return comments.count
    }
    
    func geCommentBy(index: Int) -> Comment {
        return comments[index]
    }
    
    func createCommentCellViewModel(for commentIndex: Int) -> CommentCellViewModel {
        return CommentCellViewModel(comment: comments[commentIndex])
    }
    
    func fetchComments(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { (comments: [Comment]) in
            self.comments = comments
            onSuccess()
        }
        commentsRepository.fetchComments(bookId: bookId, onSuccess: onFetchSuccess, onError: onError)
    }
}
