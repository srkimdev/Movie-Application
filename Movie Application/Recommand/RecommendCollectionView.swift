//
//  RecommendCollectionView.swift
//  Movie Application
//
//  Created by 김성률 on 6/30/24.
//

import UIKit
import SnapKit

class RecommendCollectionView: BaseView {
    
    let movieTitle = UILabel()
    
    lazy var movieTableView = {
        let view = UITableView()
        view.register(RecommandMovieTableViewCell.self, forCellReuseIdentifier: RecommandMovieTableViewCell.identifier)
        view.rowHeight = 190
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func configureHierarchy() {
        
        addSubview(movieTitle)
        addSubview(movieTableView)
        
    }
    
    override func configureLayout() {
        
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).offset(8)
            make.height.equalTo(30)
        }
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(8)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    override func configureUI() {
        
        backgroundColor = .black
        
        movieTitle.textColor = .white
        movieTitle.font = .systemFont(ofSize: 25, weight: .bold)
        
        movieTableView.backgroundColor = .black
        
    }
    
    
}
