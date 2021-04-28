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
    
    init(viewModel: CommentsSectionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = commentsSectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
        loadComments()
    }
    
    private func configureTable() {
        commentsSectionView.tableComments.delegate = self
        commentsSectionView.tableComments.dataSource = self
        let nib = UINib.init(nibName: CommentCellView.identifier, bundle: nil)
        commentsSectionView.tableComments.register(nib, forCellReuseIdentifier: CommentCellView.identifier)
        
        commentsSectionView.tableComments.rowHeight = UITableView.automaticDimension
    }
    
    private func loadComments() {
        viewModel.fetchComments(onSuccess: { [weak self] in self?.reloadTable() }, onError: { [weak self] _ in self?.showError() })
    }
    
    private func reloadTable() {
        if viewModel.noComments {
            showMessageIntoCommentsSection(message: "NO_COMMENTS_MESSAGE".localized())
        } else {
            commentsSectionView.tableComments.reloadData()
        }
    }
    
    private func showError() {
        showMessageIntoCommentsSection(message: "COMMENTS_ERROR_MESSAGE".localized())
    }
    
    private func showMessageIntoCommentsSection(message: String) {
        let labelMessage = UILabel()
        labelMessage.text = message
        labelMessage.textColor = .systemGray4
        labelMessage.textAlignment = .center
        fixIn(labelMessage, into: commentsSectionView.viewContainer)
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
