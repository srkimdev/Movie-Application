//
//  ViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/4/24.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {

    let titleLabel = UILabel()
    let emailUI = UILabel()
    let passwordUI = UILabel()
    let nicknameUI = UILabel()
    let locationUI = UILabel()
    let recommandCodeUI = UILabel()
    
    let signIn = UIButton()
    let additionalInfo = UIButton()
    let switchButton = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }

    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(35)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-100)
            make.height.equalTo(40)
        }
        
        emailUI.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(130)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(35)
        }
        
        passwordUI.snp.makeConstraints { make in
            make.top.equalTo(emailUI.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(35)
        }
        
        nicknameUI.snp.makeConstraints { make in
            make.top.equalTo(passwordUI.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(35)
        }
        
        locationUI.snp.makeConstraints { make in
            make.top.equalTo(nicknameUI.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(35)
        }
        
        recommandCodeUI.snp.makeConstraints { make in
            make.top.equalTo(locationUI.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(35)
        }
        
        signIn.snp.makeConstraints { make in
            make.top.equalTo(recommandCodeUI.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(44)
        }
        
        additionalInfo.snp.makeConstraints { make in
            make.top.equalTo(signIn.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(100)
        }
        
        switchButton.snp.makeConstraints { make in
            make.top.equalTo(signIn.snp.bottom).offset(16)
            make.trailing.equalTo(-25)
            
        }
        
    }
    
    func configureHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(emailUI)
        view.addSubview(passwordUI)
        view.addSubview(nicknameUI)
        view.addSubview(locationUI)
        view.addSubview(recommandCodeUI)
        view.addSubview(signIn)
        view.addSubview(additionalInfo)
        view.addSubview(switchButton)
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        titleLabel.text = "NETFLIX"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .red
        titleLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        
        emailUI.text = "이메일 주소 또는 전화번호"
        emailUI.font = .systemFont(ofSize: 15)
        emailUI.backgroundColor = .darkGray
        emailUI.layer.cornerRadius = 5
        emailUI.textAlignment = .center
        emailUI.textColor = .white
        
        passwordUI.text = "비밀번호"
        passwordUI.font = .systemFont(ofSize: 15)
        passwordUI.backgroundColor = .darkGray
        passwordUI.layer.cornerRadius = 5
        passwordUI.textAlignment = .center
        passwordUI.textColor = .white
        
        nicknameUI.text = "닉네임"
        nicknameUI.font = .systemFont(ofSize: 15)
        nicknameUI.backgroundColor = .darkGray
        nicknameUI.layer.cornerRadius = 5
        nicknameUI.textAlignment = .center
        nicknameUI.textColor = .white
        
        locationUI.text = "위치"
        locationUI.font = .systemFont(ofSize: 15)
        locationUI.backgroundColor = .darkGray
        locationUI.layer.cornerRadius = 5
        locationUI.textAlignment = .center
        locationUI.textColor = .white
        
        recommandCodeUI.text = "추천 코드 입력"
        recommandCodeUI.font = .systemFont(ofSize: 15)
        recommandCodeUI.backgroundColor = .darkGray
        recommandCodeUI.layer.cornerRadius = 5
        recommandCodeUI.textAlignment = .center
        recommandCodeUI.textColor = .white
        
        signIn.setTitle("회원가입", for: .normal)
        signIn.setTitleColor(.black, for: .normal)
        signIn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        signIn.backgroundColor = .white
        signIn.layer.cornerRadius = 5
        
        additionalInfo.setTitle("추가 정보 입력", for: .normal)
        additionalInfo.backgroundColor = .black
        additionalInfo.setTitleColor(.white, for: .normal)
        additionalInfo.titleLabel?.font = .systemFont(ofSize: 15)
        
        switchButton.onTintColor = .red
        switchButton.isOn = true
        
    }

}


