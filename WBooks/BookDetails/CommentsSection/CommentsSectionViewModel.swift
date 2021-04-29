//
//  CommentsSectionViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 15/04/2021.
//

final class CommentsSectionViewModel {
    private let bookId: Int
    private var comments: [Comment] = []
    private let commentsRepository: CommentRepositoryType
    private let userRepository: UserRepositoryType
    
    init(bookId: Int, commentsRepository: CommentRepositoryType = CommentRepository(), userRepository: UserRepositoryType = UserRepository()) {
        self.bookId = bookId
        self.commentsRepository = commentsRepository
        self.userRepository = userRepository
    }
    
    var numberOfComments: Int {
        comments.count
    }
    
    var noComments: Bool {
        return numberOfComments == 0
    }
    
    func createCommentCellViewModel(for commentIndex: Int) -> CommentCellViewModel {
        CommentCellViewModel(comment: comments[commentIndex])
    }
    
    func fetchComments(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { [weak self] (comments: [Comment]) in
            self?.comments = comments
            onSuccess()
        }
        commentsRepository.fetchComments(bookId: bookId, onSuccess: onFetchSuccess, onError: onError)
    }
}
