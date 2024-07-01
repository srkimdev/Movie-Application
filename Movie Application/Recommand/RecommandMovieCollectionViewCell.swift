//
//  RecommandMovieCollectionViewCell.swift
//  Movie Application
//
//  Created by 김성률 on 6/24/24.
//

import UIKit
import Kingfisher
import SnapKit

final class RecommandMovieCollectionViewCell: BaseCollectionViewCell {
    
    let movieImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    override func configureHierarchy() {
        contentView.addSubview(movieImage)
    }
    
    override func configureLayout() {
        movieImage.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
    
    override func configureUI() {
        movieImage.backgroundColor = .black
        movieImage.layer.cornerRadius = 5
        movieImage.layer.masksToBounds = true
    }
    
    private func designCell(transition: RecommandKind) {
        let url = URL(string: "https://image.tmdb.org/t/p/w780" + (transition.poster_path ?? ""))
        movieImage.kf.setImage(with: url)
    }
}
