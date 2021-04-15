//
//  BookDetailsViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

final class BookDetailsViewController: UIViewController {
    private let bookDetailsView = BookDetailsView()
    private let bookSectionViewController: BookSectionViewController
    private let commentsSectionViewController: CommentsSectionViewController

    init(book: Book, bookImage: UIImage? = nil) {
        bookSectionViewController = BookSectionViewController(book: book, bookImage: bookImage)
        commentsSectionViewController = CommentsSectionViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = bookDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        bookDetailsView.sectionsContainer.addArrangedSubview(bookSectionViewController.view)
        bookDetailsView.sectionsContainer.addArrangedSubview(commentsSectionViewController.view)
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
