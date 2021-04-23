//
//  Comments.swift
//  WBooks
//
//  Created by joaquin bozzalla on 15/04/2021.
//

struct Comment: Codable {
    let id: Int
    let user_id: Int
    let book_id: Int
    let content: String
}
