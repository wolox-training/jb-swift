//
//  Book.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

public struct Book: Codable {
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
}
