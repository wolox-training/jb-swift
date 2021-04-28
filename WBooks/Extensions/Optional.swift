//
//  Optional.swift
//  WBooks
//
//  Created by joaquin bozzalla on 28/04/2021.
//

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
