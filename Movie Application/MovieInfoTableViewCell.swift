//
//  MovieInfoTableViewCell.swift
//  Movie Application
//
//  Created by 김성률 on 6/12/24.
//

import UIKit
import SnapKit

class MovieInfoTableViewCell: UITableViewCell {
    
    let actorImage = UIImageView()
    let actorName = UILabel()
    let characterName = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
        contentView.addSubview(actorImage)
        contentView.addSubview(actorName)
        contentView.addSubview(characterName)
    }
    
    func configureLayout() {
        
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
    
    func configureUI() {
        
        actorImage.backgroundColor = .red
        actorImage.layer.masksToBounds = true
        actorImage.layer.cornerRadius = 8
        
        actorName.text = "Lee Jung-jae"
        actorName.font = .systemFont(ofSize: 16)
        
        characterName.text = "Seong Gi-hun / No.456"
        characterName.font = .systemFont(ofSize: 13)
    }
    
    func designCell(transition: MovieInfo2) {
        
        actorName.text = transition.name
        let url = URL(string: "https://image.tmdb.org/t/p/w780" + transition.profile_path!)
        actorImage.kf.setImage(with: url)
        characterName.text = transition.character
        
    }
    
}
