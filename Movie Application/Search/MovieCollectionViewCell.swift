//
//  MovieCollectionViewCell.swift
//  Movie Application
//
//  Created by 김성률 on 6/11/24.
//

import UIKit
import SnapKit
import Kingfisher

class MovieCollectionViewCell: BaseCollectionViewCell {
    
    let movieImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    override func configureHierarchy() {
        contentView.addSubview(movieImage)
    }
    
    override func configureLayout() {
        movieImage.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    override func configureUI() {
        movieImage.layer.masksToBounds = true
        movieImage.layer.cornerRadius = 5
    }
    
    func designCell(transition: MoviePoster) {
        let url = URL(string: "https://image.tmdb.org/t/p/w780" + (transition.poster_path!))
        movieImage.kf.setImage(with: url)
    }
    
}
