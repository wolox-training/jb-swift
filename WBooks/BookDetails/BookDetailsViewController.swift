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
        buildSections()
    }
    
    private func buildSections() {
        _bookDetailsView.sectionsContainer.addArrangedSubview(_bookSectionViewController.view)
        _bookDetailsView.sectionsContainer.addArrangedSubview(_commentsSectionViewController.view)
    }
    
    private func configureNavBar() {
        navigationItem.leftBarButtonItem = createBackButton()
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = createNavBarTitle()
    }
    
    private func createBackButton() -> UIBarButtonItem {
        let imageView = UIImageView(image: UIImage.back)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18),
            NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18)
        ])

        return UIBarButtonItem(customView: imageView)
    }
    
    private func createNavBarTitle() -> UILabel {
        let navBarTitle = UILabel()
        navBarTitle.frame = CGRect(x: 156, y: 42, width: 64, height: 20)
        navBarTitle.lineBreakMode = .byWordWrapping
        navBarTitle.numberOfLines = 0
        navBarTitle.textColor = .white
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.1764705882352942
        paragraphStyle.alignment = .center
        navBarTitle.text = "BOOK_DETAIL_LABEL".localized()
        navBarTitle.sizeToFit()
        
        return navBarTitle
    }
}
