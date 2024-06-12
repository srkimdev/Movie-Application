//
//  MovieInfoViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/12/24.
//

import UIKit
import SnapKit

class MovieInfoViewController: UIViewController {

    let movieInfoTableView = UITableView()
    let movieTitle = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        movieInfoTableView.delegate = self
        movieInfoTableView.dataSource = self
        
    }
    
    func configureHierarchy() {
        
        
    }
    
    func configureLayout() {
        
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "출연/제작"
        
    }

}

extension MovieInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = movieInfoTableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    
}
