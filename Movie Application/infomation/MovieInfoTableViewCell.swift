//
//  MovieInfoTableViewCell.swift
//  Movie Application
//
//  Created by 김성률 on 6/12/24.
//

import UIKit
import SnapKit

class MovieInfoTableViewCell: BaseTableViewCell {
    
    let actorImage = UIImageView()
    let actorName = UILabel()
    let characterName = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func configureHierarchy() {
        
        contentView.addSubview(actorImage)
        contentView.addSubview(actorName)
        contentView.addSubview(characterName)
    }
    
    override func configureLayout() {
        
        actorImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-8)
            make.width.equalTo(52)
        }
        
        actorName.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(actorImage.snp.trailing).offset(20)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(20)
        }
        
        characterName.snp.makeConstraints { make in
            make.leading.equalTo(actorImage.snp.trailing).offset(20)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(20)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-16)
        }
        
    }
    
    override func configureUI() {
        
        actorImage.backgroundColor = .red
        actorImage.layer.masksToBounds = true
        actorImage.layer.cornerRadius = 8
    
        actorName.font = .systemFont(ofSize: 16)
        
        characterName.font = .systemFont(ofSize: 13)
    }
    
    func designCell(transition: detailMovieInfo) {
        
        actorName.text = transition.name
        let url = URL(string: "https://image.tmdb.org/t/p/w780" + (transition.profile_path ?? ""))
        actorImage.kf.setImage(with: url)
        characterName.text = transition.character
        
    }
    
}
