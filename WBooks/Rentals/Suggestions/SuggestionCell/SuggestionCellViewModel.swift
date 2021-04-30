//
//  SuggestionCellViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 22/04/2021.
//

final class SuggestionCellViewModel {
    private let suggestion: Suggestion
    
    init(suggestion: Suggestion) {
        self.suggestion = suggestion
    }
    
    var imageURL: String {
        return suggestion.link
    }
}
