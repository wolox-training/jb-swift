//
//  CommentsSectionViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

final class CommentsSectionViewController: UIViewController {
    private let _commentsSectionView = CommentsSectionView()
    
    override func loadView() {
        super.loadView()
        self.view = _commentsSectionView
    }
}