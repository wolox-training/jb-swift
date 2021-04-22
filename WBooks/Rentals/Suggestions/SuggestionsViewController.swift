//
//  SuggestionsViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 21/04/2021.
//

import UIKit

final class SuggestionsViewController: UIViewController {
    private let suggestionsView = SuggestionsView()
    private let viewModel = SuggestionsViewModel()
    
    override func loadView() {
        super.loadView()
        view = suggestionsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        loadData()
    }
    
    private func configureCollection() {
        suggestionsView.suggestionsCollection.delegate = self
        suggestionsView.suggestionsCollection.dataSource = self
        let nib = UINib(nibName: SuggestionCellView.identifier, bundle: nil)
        suggestionsView.suggestionsCollection.register(nib, forCellWithReuseIdentifier: SuggestionCellView.identifier)
    }
    
    private func loadData() {
        viewModel.fecthSuggestions(
            onSuccess: { [weak self] in self?.reloadCollection() },
            onError: { [weak self] _ in self?.showMessageIntoSuggestionsSection(message: "SUGGESTIONS_ERROR_MESSAGE".localized()) }
        )
    }
    
    private func reloadCollection() {
        suggestionsView.suggestionsCollection.reloadData()
        if(viewModel.noSuggestions) {
            showMessageIntoSuggestionsSection(message: "NO_SUGGESTIONS_MESSAGE".localized())
        }
    }
    
    private func showMessageIntoSuggestionsSection(message: String) {
        let labelMessage = UILabel()
        labelMessage.text = message
        labelMessage.textColor = .systemGray4
        labelMessage.textAlignment = .center
        
        suggestionsView.view.addSubview(labelMessage)
        suggestionsView.view.translatesAutoresizingMaskIntoConstraints = false
        labelMessage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelMessage.topAnchor.constraint(equalTo: suggestionsView.suggestionsCollection.topAnchor),
            labelMessage.bottomAnchor.constraint(equalTo: suggestionsView.suggestionsCollection.bottomAnchor),
            labelMessage.leadingAnchor.constraint(equalTo: suggestionsView.suggestionsCollection.leadingAnchor),
            labelMessage.trailingAnchor.constraint(equalTo: suggestionsView.suggestionsCollection.trailingAnchor)
        ])
    }
}

extension SuggestionsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfSuggestions
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestionCellView.identifier, for: indexPath) as! SuggestionCellView
        let suggestionViewModel = viewModel.createSuggestionCellViewModel(index: indexPath.row)
        cell.configureCell(with: suggestionViewModel)
        
        return cell
    }
}
