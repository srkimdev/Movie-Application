//
//  MovieInfo2TableViewCell.swift
//  Movie Application
//
//  Created by 김성률 on 6/12/24.
//

import UIKit
import SnapKit

class MovieInfo2TableViewCell: BaseTableViewCell {
    
    let overViewLabel = UILabel()
    let plusButton = UIButton()
    var toggle: Bool = true

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func configureHierarchy() {
        contentView.addSubview(overViewLabel)
        contentView.addSubview(plusButton)
    }
    
    override func configureLayout() {
        overViewLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(8)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.height.greaterThanOrEqualTo(30).priority(.required)
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(overViewLabel.snp.bottom)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-4)
        }
        
    }
    
    override func configureUI() {
        overViewLabel.numberOfLines = 2
        plusButton.tintColor = .black
        plusButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    }
    
    func designCell(transition: weekMovieInfo) {
        overViewLabel.text = transition.overview
        overViewLabel.font = .systemFont(ofSize: 14)
    }
    
}
