//
//  TabBarViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/4/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainscreen = MainScreenViewController()
        let setting = SettingViewController()
        let other = otherViewController()
        
        mainscreen.title = "홈"
        setting.title = "NEW & HOT"
        other.title = "저장한 콘텐츠 목록"
        
        mainscreen.tabBarItem.image = UIImage.init(systemName: "house")
        setting.tabBarItem.image = UIImage.init(systemName: "magnifyingglass")
        other.tabBarItem.image = UIImage.init(systemName: "book")
        
        let navigationHome = UINavigationController(rootViewController: mainscreen)
        let navigationSetting = UINavigationController(rootViewController: setting)
        let navigationOther = UINavigationController(rootViewController: other)
        
        setViewControllers([navigationHome, navigationSetting, navigationOther], animated: false)
    }
}
