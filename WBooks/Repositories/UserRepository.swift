//
//  UserRepository.swift
//  WBooks
//
//  Created by joaquin bozzalla on 15/04/2021.
//

import Alamofire

protocol UserRepositoryType {
    func fetchUser(userId: Int, onSuccess: @escaping (User) -> Void, onError: @escaping (Error) -> Void)
}

final class UserRepository: UserRepositoryType {
    
    func fetchUser(userId: Int, onSuccess: @escaping (User) -> Void, onError: @escaping (Error) -> Void) {
        AF
            .request(URL.user(userId: userId), method: .get)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    guard let JSONUser = try? JSONSerialization.data(withJSONObject: value, options: []), let user = try? JSONDecoder().decode(User.self, from: JSONUser) else {
                        onError(UserError.decodeError)
                        return
                    }

                    onSuccess(user)
                case .failure(let error):
                    onError(error)
                }
            })
    }
}

enum UserError: Error {
    case decodeError
}
