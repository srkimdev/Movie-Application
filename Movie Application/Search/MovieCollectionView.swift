//
//  MovieCollectionView.swift
//  Movie Application
//
//  Created by 김성률 on 6/29/24.
//

import UIKit
import SnapKit

final class MovieCollectionView: BaseView {
    
    lazy var movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    let searchBar = UISearchBar()
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(width: width/3, height: 150)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return layout
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
    }
    
    override func configureHierarchy() {
        addSubview(searchBar)
        addSubview(movieCollectionView)
    }
    
    override func configureLayout() {
        
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        movieCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    override func configureUI() {
        backgroundColor = .white
        searchBar.placeholder = "영화 제목을 검색해보세요."
    }

}
