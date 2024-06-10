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
        let movie = MovieListViewController()
        
        mainscreen.title = "홈"
        setting.title = "NEW & HOT"
        movie.title = "저장한 콘텐츠 목록"
        
        mainscreen.tabBarItem.image = UIImage.init(systemName: "house")
        setting.tabBarItem.image = UIImage.init(systemName: "magnifyingglass")
        movie.tabBarItem.image = UIImage.init(systemName: "book")
        
        let navigationHome = UINavigationController(rootViewController: mainscreen)
        let navigationSetting = UINavigationController(rootViewController: setting)
        let navigationMovie = UINavigationController(rootViewController: movie)
        
        setViewControllers([navigationHome, navigationSetting, navigationMovie], animated: false)
    }
}
