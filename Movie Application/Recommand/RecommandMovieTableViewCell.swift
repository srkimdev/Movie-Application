//
//  RecommandMovieTableViewCell.swift
//  Movie Application
//
//  Created by 김성률 on 6/25/24.
//

import UIKit
import SnapKit

class RecommandMovieTableViewCell: BaseTableViewCell {
    
    let titleLabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 18)
        view.textColor = .blue
        view.textColor = .white
        return view
    }()

    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 104, height: 150)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        return layout
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    override func configureHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)
    }
    
    override func configureLayout() {
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.top.equalTo(contentView).offset(8)
            make.horizontalEdges.equalTo(contentView).inset(8)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(contentView)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
    }
    
    override func configureUI() {
        contentView.backgroundColor = .black
        collectionView.backgroundColor = .black
    }
    
    func designCell(text: String) {
        
        titleLabel.text = text
        
    }
    
}
