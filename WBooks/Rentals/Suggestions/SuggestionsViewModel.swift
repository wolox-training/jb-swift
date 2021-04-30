//
//  SuggestionsViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 21/04/2021.
//

import UIKit

final class SuggestionsViewModel {
    private let suggestionsRepository: SuggestionsRepositoryType
    private var suggestions: [Suggestion] = []
    
    init(suggestionsRepository: SuggestionsRepositoryType = SuggestionsRepository()) {
        self.suggestionsRepository = suggestionsRepository
    }
    
    var numberOfSuggestions: Int {
        return suggestions.count
    }
    
    var noSuggestions: Bool {
        return numberOfSuggestions == 0
    }
    
    func fecthSuggestions(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void ) {
        let onFetchSuccess = { [weak self] (suggestions: [Suggestion]) in
            self?.suggestions = suggestions
            onSuccess()
        }
        
        suggestionsRepository.fetchSuggestions(userId: 9, onSuccess: onFetchSuccess, onError: onError)
    }
    
    func createSuggestionCellViewModel(index: Int) -> SuggestionCellViewModel {
        return SuggestionCellViewModel(suggestion: suggestions[index])
    }
}
