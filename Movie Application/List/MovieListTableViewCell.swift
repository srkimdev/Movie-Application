//
//  MovieListTableViewCell.swift
//  Movie Application
//
//  Created by 김성률 on 6/10/24.
//

import UIKit
import SnapKit
import Kingfisher

final class MovieListTableViewCell: BaseTableViewCell {

    let dateLabel = UILabel()
    let hashLabel = UILabel()
    
    let infoView = UIView()
    let shadowView = UIView()
    
    let clipImage = UIImageView()
    let movieImage = UIImageView()
    let rateLabel1 = UILabel()
    let rateLabel2 = UILabel()
    
    let movieTitleLabel = UILabel()
    let characterLabel = UILabel()
    let line = UIView()
    let detailLabel = UILabel()
    let nextButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    override func configureHierarchy() {
        
        contentView.addSubview(dateLabel)
        contentView.addSubview(hashLabel)
        
        contentView.addSubview(shadowView)
        contentView.addSubview(infoView)

        infoView.addSubview(movieImage)
        contentView.addSubview(clipImage)
        contentView.addSubview(rateLabel1)
        contentView.addSubview(rateLabel2)
        
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(characterLabel)
        contentView.addSubview(line)
        contentView.addSubview(detailLabel)
        contentView.addSubview(nextButton)
        
    }
    
    override func configureLayout() {
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(16)
        }
        
        hashLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(4)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(20)
        }
        
        shadowView.snp.makeConstraints { make in
            make.top.equalTo(hashLabel.snp.bottom).offset(12)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-16)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-16)
        }
        
        infoView.snp.makeConstraints { make in
            make.top.equalTo(hashLabel.snp.bottom).offset(12)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-16)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-16)
        }
        
        movieImage.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.top)
            make.leading.equalTo(infoView.snp.leading)
            make.trailing.equalTo(infoView.snp.trailing)
            make.bottom.equalTo(infoView.snp.bottom).offset(-120)
        }
        
        clipImage.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.top).offset(16)
            make.trailing.equalTo(infoView.snp.trailing).offset(-16)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        rateLabel1.snp.makeConstraints { make in
            make.leading.equalTo(movieImage.snp.leading).offset(16)
            make.bottom.equalTo(movieImage.snp.bottom).offset(-16)
            make.width.equalTo(28)
            make.height.equalTo(24)
        }
        
        rateLabel2.snp.makeConstraints { make in
            make.leading.equalTo(rateLabel1.snp.trailing)
            make.bottom.equalTo(movieImage.snp.bottom).offset(-16)
            make.width.equalTo(28)
            make.height.equalTo(24)
        }
        
        movieTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(movieImage.snp.bottom).offset(16)
            make.leading.equalTo(infoView.snp.leading).offset(16)
            make.trailing.equalTo(infoView.snp.trailing).offset(-16)
            make.height.equalTo(24)
        }
        
        characterLabel.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp.bottom)
            make.leading.equalTo(infoView.snp.leading).offset(16)
            make.trailing.equalTo(infoView.snp.trailing).offset(-16)
            make.height.equalTo(20)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(characterLabel.snp.bottom).offset(16)
            make.leading.equalTo(infoView.snp.leading).offset(16)
            make.trailing.equalTo(infoView.snp.trailing).offset(-16)
            make.height.equalTo(1)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(14)
            make.leading.equalTo(infoView.snp.leading).offset(16)
            make.trailing.equalTo(infoView.snp.trailing).offset(-16)
            make.bottom.equalTo(infoView.snp.bottom).offset(-10)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(14)
            make.trailing.equalTo(infoView.snp.trailing).offset(-16)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }
        
    }
    
    override func configureUI() {
        
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 12)

        hashLabel.font = .boldSystemFont(ofSize: 18)
        
        shadowView.backgroundColor = .white
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 10
        shadowView.layer.cornerRadius = 10
        shadowView.layer.shadowOpacity = 0.5
        
        infoView.layer.cornerRadius = 10
        infoView.layer.masksToBounds = true
        
        clipImage.backgroundColor = .white
        clipImage.image = UIImage(systemName: "paperclip")
        clipImage.tintColor = .black
        clipImage.layer.masksToBounds = true
        clipImage.layer.cornerRadius = 12
        
        rateLabel1.backgroundColor = #colorLiteral(red: 0.3468087614, green: 0.3369399607, blue: 0.8411970139, alpha: 1)
        rateLabel1.text = "평점"
        rateLabel1.textColor = .white
        rateLabel1.font = .systemFont(ofSize: 12)
        rateLabel1.textAlignment = .center

        rateLabel2.backgroundColor = .white
        rateLabel2.font = .systemFont(ofSize: 12)
        rateLabel2.textAlignment = .center
        
        movieTitleLabel.font = .systemFont(ofSize: 18)
        characterLabel.font = .systemFont(ofSize: 13)
        characterLabel.textColor = .darkGray
        
        line.backgroundColor = .black
        
        detailLabel.text = "자세히 보기"
        detailLabel.font = .systemFont(ofSize: 12)
        
        nextButton.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        nextButton.tintColor = .gray
        
    }
    
    private func designCell(transition: weekMovieInfo) {
        
        movieTitleLabel.text = transition.title
        dateLabel.text = transition.release_date
        
        let url = URL(string: "https://image.tmdb.org/t/p/w780" + transition.poster_path)
        movieImage.kf.setImage(with: url)

        let number = transition.vote_average
        let formattedNumber = String(format: "%.1f", number)
        rateLabel2.text = formattedNumber
        
        let genreNames = transition.genre_ids.compactMap { Genre.genres[$0] }
        let joinedGenres = genreNames.joined(separator: ", ")
        hashLabel.text = joinedGenres
        
    }
    
    private func designCell(transition: [String]) {
        let joinedString = transition.joined(separator: ", ")
        characterLabel.text = joinedString
    }
}
