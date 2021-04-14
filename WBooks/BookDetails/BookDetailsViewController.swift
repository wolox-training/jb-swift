//
//  BookDetailsViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

final class BookDetailsViewController: UIViewController {
    private let _bookDetailsView = BookDetailsView()
    private let _bookSectionViewController: BookSectionViewController
    private let _commentsSectionViewController: CommentsSectionViewController
    private var _book: Book;
    
    init(book: Book) {
        _book = book
        _bookSectionViewController = BookSectionViewController(book: _book)
        _commentsSectionViewController = CommentsSectionViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = _bookDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        
        _bookDetailsView.sectionsContainer.addArrangedSubview(_bookSectionViewController.view)
        _bookDetailsView.sectionsContainer.addArrangedSubview(_commentsSectionViewController.view)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "BOOK_DETAILS_LABEL".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.back, style: .plain, target: self, action: #selector(self.goBack(_:)))
    }

    @objc private func goBack(_ sender:UIBarButtonItem!) {
        dismiss(animated: true)
    }
}
