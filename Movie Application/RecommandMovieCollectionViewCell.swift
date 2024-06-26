//
//  RecommandMovieCollectionViewCell.swift
//  Movie Application
//
//  Created by 김성률 on 6/24/24.
//

import UIKit
import Kingfisher
import SnapKit

class RecommandMovieCollectionViewCell: UICollectionViewCell {
    
    let movieImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(movieImage)
    }
    
    func configureLayout() {
        
        movieImage.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
    }
    
    func configureUI() {
        movieImage.backgroundColor = .black
        movieImage.layer.cornerRadius = 5
        movieImage.layer.masksToBounds = true
    }
    
    func designCell(transition: RecommandKind) {

        let url = URL(string: "https://image.tmdb.org/t/p/w780" + (transition.poster_path ?? ""))
        movieImage.kf.setImage(with: url)
        
    }
}
