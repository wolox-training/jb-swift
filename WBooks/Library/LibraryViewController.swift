//
//  MainMenuViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class MainMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let mainMenuView = MainMenuView()
    private let _viewModel = MainMenuViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = mainMenuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainMenuView.tblBooks.delegate = self
        self.mainMenuView.tblBooks.dataSource = self
        let nib = UINib.init(nibName: "BookCellView", bundle: nil)
        self.mainMenuView.tblBooks.register(nib, forCellReuseIdentifier: "BookCellView")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.numberOfBooks
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCellView", for: indexPath) as! BookCellView
        let bookCellViewModel = _viewModel.createBookCellViewModel(for:indexPath.row)
        cell.configureCell(with: bookCellViewModel)
        return cell
    }
}
