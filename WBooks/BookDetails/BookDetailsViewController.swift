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
        commentsSectionViewController = CommentsSectionViewController(book: book)
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
        addSection(bookSectionViewController)
        addSection(commentsSectionViewController)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "BOOK_DETAILS_LABEL".localized()
    }
    
    private func addSection(_ child: UIViewController) {
        addChild(child)
        bookDetailsView.sectionsContainer.addArrangedSubview(child.view)
        child.view.frame = bookDetailsView.sectionsContainer.frame
        child.didMove(toParent: self)
    }
}
