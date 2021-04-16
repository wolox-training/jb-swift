//
//  CommentCellViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 15/04/2021.
//

import Foundation
import UIKit

final class CommentCellViewModel {
    private let comment: Comment
    private var user: User?
    private let userRepository = UserRepository()
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    var userName: String {
        return user?.username ?? ""
    }
    
    var userAvatar: String {
        return user?.image ?? ""
    }
    
    var content: String {
        return comment.content
    }
    
    func loadUser(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { (user: User) in
            self.user = user
            onSuccess()
        }
        userRepository.fetchUser(userId: comment.user_id, onSuccess: onFetchSuccess, onError: onError)
    }
}
