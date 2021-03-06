//
//  RentRepository.swift
//  WBooks
//
//  Created by joaquin bozzalla on 15/04/2021.
//

import Alamofire

protocol RentRepositoryType {
    func rentBook(userId: Int, bookId: Int, onSuccess: @escaping (Rent) -> Void, onError: @escaping (Error) -> Void)
    func rentsBy(userId: Int, onSuccess: @escaping ([Rent]) -> Void, onError: @escaping (Error) -> Void)
}

final class RentRepository: RentRepositoryType {
    
    func rentsBy(userId: Int, onSuccess: @escaping ([Rent]) -> Void, onError: @escaping (Error) -> Void) {
        // Request
        AF.request(URL.rentsBy(userId: userId), method: .get)
            .responseJSON(
                completionHandler: { response in
                    switch response.result {
                    case .success(let value):
                        guard let JSONResponse = try? JSONSerialization.data(withJSONObject: value, options: []),
                              let response = try? JSONDecoder().decode([Rent].self, from: JSONResponse)
                        else {
                            onError(RentError.decodeError)
                            return
                        }
                        
                        onSuccess(response)
                    case .failure(let error):
                        onError(error)
                    }
                }
            )
    }
    
    func rentBook(userId: Int, bookId: Int, onSuccess: @escaping (Rent) -> Void, onError: @escaping (Error) -> Void) {
        // Parameters
        let today = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let parameters = RentRequest(
            book_id: bookId,
            user_id: userId,
            from: formatter.string(from: today),
            to: formatter.string(from: tomorrow)
        )
        // Request
        AF
            .request(
                URL.rents,
                method: .post,
                parameters: parameters,
                encoder: JSONParameterEncoder.default
            )
            .responseJSON(
                completionHandler: { response in
                    switch response.result {
                    case .success(let value):
                        guard let JSONResponse = try? JSONSerialization.data(withJSONObject: value, options: []),
                              let response = try? JSONDecoder().decode(Rent.self, from: JSONResponse)
                        else {
                            onError(RentError.decodeError)
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

enum RentError: Error {
    case decodeError
}
