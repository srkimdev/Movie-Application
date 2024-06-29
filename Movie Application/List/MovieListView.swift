//
//  MovieListView.swift
//  Movie Application
//
//  Created by 김성률 on 6/29/24.
//

import UIKit

class MovieListView: BaseView {
    
    let movieTableView = UITableView()
    
    override func configureHierarchy() {
        addSubview(movieTableView)
    }

    override func configureLayout() {
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(8)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-8)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }

    override func configureUI() {
        
        backgroundColor = .white
        movieTableView.rowHeight = 430
        movieTableView.separatorStyle = .none
        
    }

}
