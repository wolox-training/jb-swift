//
//  CommentCellView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 15/04/2021.
//

import UIKit

final class CommentCellView: UITableViewCell {
    @IBOutlet weak var imageUser: UIImageView! {
        didSet {
            imageUser.setRounded()
        }
    }
    @IBOutlet weak var labelUser: UILabel! {
        didSet {
            labelUser.text = ""
        }
    }
    @IBOutlet weak var labelComment: UILabel! {
        didSet {
            labelComment.text = ""
        }
    }
    
    func configureCell(with viewModel: CommentCellViewModel) {
        imageUser.image = UIImage.defaultProfile
        imageUser.tintColor = .black
        labelComment.text = viewModel.content

        let onSuccess = { [weak self] in
            self?.labelUser.text =  viewModel.userName
            self?.imageUser.loadFromURL(stringURL: viewModel.userAvatar, or: UIImage.defaultProfile)
        }
        let onError = { (error: Error) in } // If the user is not loaded nothing has to change. Default content will remain.
        viewModel.loadUser(onSuccess: onSuccess, onError: onError)
    }
    
    static var identifier: String {
        return String(describing: CommentCellView.self)
    }
}
