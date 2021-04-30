//
//  SuggestionsRepository.swift
//  WBooks
//
//  Created by joaquin bozzalla on 21/04/2021.
//

import Alamofire

protocol SuggestionsRepositoryType {
    func fetchSuggestions(userId: Int, onSuccess: @escaping ([Suggestion]) -> Void, onError: @escaping (Error) -> Void)
}

final class SuggestionsRepository: SuggestionsRepositoryType {
    func fetchSuggestions(userId: Int, onSuccess: @escaping ([Suggestion]) -> Void, onError: @escaping (Error) -> Void) {
        AF
            .request(URL.suggestions(userId: userId), method: .get)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    guard let JSONResponse = try? JSONSerialization.data(withJSONObject: value, options: []),
                          let response = try? JSONDecoder().decode([Suggestion].self, from: JSONResponse)
                    else {
                        onError(SuggestionError.decodeError)
                        return
                    }
                    onSuccess(response)
                case .failure(let error):
                    onError(error)
                }
            })
    }
}

enum SuggestionError: Error {
    case decodeError
}
