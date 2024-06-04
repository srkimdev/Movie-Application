//
//  MainScreenViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/4/24.
//

import UIKit
import SnapKit

class MainScreenViewController: UIViewController {

    let mainImage = UIImageView()
    let subImage1 = UIImageView()
    let subImage2 = UIImageView()
    let subImage3 = UIImageView()
    let crossImage = UIImageView()
    
    let playButton = UIButton(type: .custom)
    let playButtonUI = UIView()
    let saveListView = UIView()
    
    let genreList = UILabel()
    let nowHotLabel = UILabel()
    let saveListText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    func configureHierarchy() {
        view.addSubview(mainImage)
        view.addSubview(subImage1)
        view.addSubview(subImage2)
        view.addSubview(subImage3)
        view.addSubview(saveListView)
        view.addSubview(saveListText)
        view.addSubview(crossImage)
        view.addSubview(genreList)
        view.addSubview(nowHotLabel)
        view.addSubview(playButtonUI)
        view.addSubview(playButton)
    }
    
    func configureLayout() {
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(480)
            
        }
        
        nowHotLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.height.equalTo(20)
        }
        
        subImage1.snp.makeConstraints { make in
            make.top.equalTo(nowHotLabel.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.width.equalTo(115)
        }
        
        subImage2.snp.makeConstraints { make in
            make.top.equalTo(nowHotLabel.snp.bottom).offset(8)
            make.leading.equalTo(subImage1.snp.trailing).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.width.equalTo(115)
        }
        
        subImage3.snp.makeConstraints { make in
            make.top.equalTo(nowHotLabel.snp.bottom).offset(8)
            make.leading.equalTo(subImage2.snp.trailing).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
        
        playButton.snp.makeConstraints { make in
            make.top.equalTo(playButtonUI.snp.top).offset(4)
            make.leading.equalTo(playButtonUI.snp.leading).offset(16)
            make.trailing.equalTo(playButtonUI.snp.trailing).offset(-16)
            make.bottom.equalTo(playButtonUI.snp.bottom).offset(-4)
            
//
//            make.height.equalTo(35)
        }
        
        playButtonUI.snp.makeConstraints { make in
            make.leading.equalTo(mainImage.snp.leading).offset(20)
//            make.trailing.equalTo(mainImage.snp.leading).offset(-4)
            make.bottom.equalTo(mainImage.snp.bottom).offset(-20)
            make.height.equalTo(35)
            make.width.equalTo(155)
        }
        
        saveListView.snp.makeConstraints { make in
            make.bottom.equalTo(mainImage.snp.bottom).offset(-20)
            make.trailing.equalTo(mainImage.snp.trailing).offset(-20)
            make.leading.equalTo(playButtonUI.snp.trailing).offset(12)
            make.height.equalTo(35)
        }
        
        saveListText.snp.makeConstraints { make in
            make.top.equalTo(saveListView.snp.top).offset(4)
            make.trailing.equalTo(saveListView.snp.trailing).offset(-4)
            make.bottom.equalTo(saveListView.snp.bottom).offset(-4)
            make.leading.equalTo(saveListView.snp.leading).offset(35)
        }
        
        crossImage.snp.makeConstraints { make in
            make.top.equalTo(saveListView.snp.top).offset(4)
            make.leading.equalTo(saveListView.snp.leading).offset(4)
            make.trailing.equalTo(saveListText.snp.leading).offset(-4)
            make.bottom.equalTo(saveListView.snp.bottom).offset(-4)
        }
        
        genreList.snp.makeConstraints { make in
            make.leading.equalTo(mainImage.snp.leading).offset(30)
            make.trailing.equalTo(mainImage.snp.trailing).offset(-30)
            make.bottom.equalTo(playButton.snp.top).offset(-8)
            make.height.equalTo(30)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = .black
        navigationItem.title = "고래밥님"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        mainImage.image = UIImage(named: "노량")
        mainImage.layer.masksToBounds = true
        mainImage.layer.cornerRadius = 10
        
        nowHotLabel.text = "지금 뜨는 콘텐츠"
        nowHotLabel.textColor = .white
        
        subImage1.image = UIImage(named: "아바타")
        subImage1.layer.masksToBounds = true
        subImage1.layer.cornerRadius = 5
        
        subImage2.image = UIImage(named: "베테랑")
        subImage2.layer.masksToBounds = true
        subImage2.layer.cornerRadius = 5
        
        subImage3.image = UIImage(named: "부산행")
        subImage3.layer.masksToBounds = true
        subImage3.layer.cornerRadius = 5
        
        playButton.setBackgroundImage(UIImage(named: "play_normal"), for: .normal)
        playButtonUI.backgroundColor = .white
        playButtonUI.layer.cornerRadius = 5
        saveListView.backgroundColor = .darkGray
        saveListView.layer.cornerRadius = 5
        
        saveListText.text = "내가 찜한 리스트"
        saveListText.textColor = .white
        saveListText.font = .systemFont(ofSize: 15)
        saveListText.textAlignment = .center
        
        crossImage.image = UIImage(systemName: "plus")
        crossImage.tintColor = .white
        
        genreList.text = "응원하고픈 · 흥미진진 · 사극 · 전투 · 한국작품 "
        genreList.textColor = .white
        genreList.textAlignment = .center
        genreList.font = .systemFont(ofSize: 15)
    }
    
    

}

