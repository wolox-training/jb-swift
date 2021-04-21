//
//  CommentsSectionViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

final class CommentsSectionViewController: UIViewController {
    private let commentsSectionView = CommentsSectionView()
    private let viewModel: CommentsSectionViewModel
    
    init(book: Book) {
        viewModel = CommentsSectionViewModel(bookId: book.id)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = commentsSectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
        loadComments()
    }
    
    private func configureTable() {
        self.commentsSectionView.tableComments.delegate = self
        self.commentsSectionView.tableComments.dataSource = self
        let nib = UINib.init(nibName: CommentCellView.identifier, bundle: nil)
        self.commentsSectionView.tableComments.register(nib, forCellReuseIdentifier: CommentCellView.identifier)
        
        self.commentsSectionView.tableComments.rowHeight = UITableView.automaticDimension
    }
    
    private func loadComments() {
        viewModel.fetchComments(onSuccess: reloadTable, onError: { [weak self] _ in self?.showError() })
    }
    
    private func reloadTable() {
        self.commentsSectionView.tableComments.reloadData()
    }
    
    private func showError() {
        showAlert(title: "ERROR_ALERT_TITLE".localized(), message: "COMMENTS_ERROR_ALERT_MESSAGE".localized(), closeButtonLabel: "ERROR_ALERT_CLOSE".localized())
    }
}

extension CommentsSectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfComments
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCellView.identifier, for: indexPath) as! CommentCellView
        let commentCellViewModel = viewModel.createCommentCellViewModel(for:indexPath.row)
        cell.configureCell(with: commentCellViewModel)
        return cell
    }
}
