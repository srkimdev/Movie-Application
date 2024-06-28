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
        
        UITabBar.appearance().backgroundColor = .white
        
        let home = MainScreenViewController()
        let setting = SettingViewController()
        let movieList = MovieListViewController()
        
        home.title = "홈"
        setting.title = "NEW & HOT"
        movieList.title = "저장한 콘텐츠 목록"
        
        home.tabBarItem.image = UIImage.init(systemName: "house")
        setting.tabBarItem.image = UIImage.init(systemName: "magnifyingglass")
        movieList.tabBarItem.image = UIImage.init(systemName: "book")
        
        let navigationHome = UINavigationController(rootViewController: home)
        let navigationSetting = UINavigationController(rootViewController: setting)
        let navigationMovie = UINavigationController(rootViewController: movieList)
        
        setViewControllers([navigationHome, navigationSetting, navigationMovie], animated: false)
    }
}
