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

    init(viewModel: BookDetailsViewModel) {
        let bookSectionViewModel = viewModel.createBookSectionViewModel()
        bookSectionViewController = BookSectionViewController(viewModel: bookSectionViewModel)
        let commentsSectionViewModel = viewModel.createCommentsSectionViewModel()
        commentsSectionViewController = CommentsSectionViewController(viewModel: commentsSectionViewModel)
        
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
        navigationItem.title = "BOOK_DETAILS_LABEL".localized()
    }
    
    private func addSection(_ child: UIViewController) {
        addChild(child)
        bookDetailsView.sectionsContainer.addArrangedSubview(child.view)
        child.view.frame = bookDetailsView.sectionsContainer.frame
        child.didMove(toParent: self)
    }
}
