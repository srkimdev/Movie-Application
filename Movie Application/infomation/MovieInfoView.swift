//
//  MovieInfoView.swift
//  Movie Application
//
//  Created by 김성률 on 6/29/24.
//

import UIKit
import SnapKit

class MovieInfoView: BaseView {
    
    let movieBackground = UIImageView()
    let movieTitle = UILabel()
    let moviePoster = UIImageView()
    let movieInfoTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        movieInfoTableView.register(MovieInfoTableViewCell.self, forCellReuseIdentifier: MovieInfoTableViewCell.identifier)
        movieInfoTableView.register(MovieInfo2TableViewCell.self, forCellReuseIdentifier: MovieInfo2TableViewCell.identifier)
    }
    
    override func configureHierarchy() {
        
        addSubview(movieBackground)
        movieBackground.addSubview(movieTitle)
        movieBackground.addSubview(moviePoster)
        addSubview(movieInfoTableView)
        
    }
    
    override func configureLayout() {
        
        movieBackground.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(180)
        }
        
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(movieBackground.snp.top).offset(20)
            make.leading.equalTo(movieBackground.snp.leading).offset(20)
            make.trailing.equalTo(movieBackground.snp.trailing)
            make.height.equalTo(30)
        }
        
        moviePoster.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(8)
            make.leading.equalTo(movieBackground.snp.leading).offset(24)
            make.width.equalTo(90)
            make.bottom.equalTo(movieBackground.snp.bottom).offset(-8)
        }
        
        movieInfoTableView.snp.makeConstraints { make in
            make.top.equalTo(movieBackground.snp.bottom)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    override func configureUI() {
        
        backgroundColor = .white
        
        movieBackground.backgroundColor = .lightGray
        
        movieTitle.textColor = .white
        movieTitle.font = .boldSystemFont(ofSize: 24)
        
    }
    
}
