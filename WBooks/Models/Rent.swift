//
//  Rent.swift
//  WBooks
//
//  Created by joaquin bozzalla on 15/04/2021.
//

struct RentRequest : Codable {
    let book_id: Int
    let user_id: Int
    let from: String
    let to: String
}

struct Rent : Codable {
    let book_id: Int
    let user_id: Int
    let id: Int
    let from: String
    let to: String
}
