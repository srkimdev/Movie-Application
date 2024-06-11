//
//  MovieCollectionViewCell.swift
//  Movie Application
//
//  Created by 김성률 on 6/11/24.
//

import UIKit
import SnapKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
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
            make.edges.equalTo(contentView)
        }
        
    }
    
    func configureUI() {
        
        movieImage.layer.masksToBounds = true
        movieImage.layer.cornerRadius = 5
        
    }
    
    func designCell(transition: MoviePoster) {
        
        let url = URL(string: "https://image.tmdb.org/t/p/w780" + (transition.poster_path ?? ""))
        movieImage.kf.setImage(with: url)
        
    }
    
}
