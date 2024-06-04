//
//  ViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/4/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        
    }

    func configureLayout() {
        
        nextButton.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.trailing.equalTo(-100)
            make.height.equalTo(30)
        }
        
    }
    
    func configureHierarchy() {
        view.addSubview(nextButton)
    }
    
    func configureUI() {
        
        nextButton.setTitle("버튼", for: .normal)
        nextButton.backgroundColor = .black
        nextButton.setTitleColor(.white, for: .normal)
        
    }
    
    @objc func nextButtonClicked() {
        
        let vc = MainScreenViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

