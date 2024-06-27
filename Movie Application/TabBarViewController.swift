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
        
        let mainscreen = MainScreenViewController()
        let setting = SettingViewController()
        let movie = MovieListViewController()
        let recommand = RecommandMovieViewController()
        
        mainscreen.title = "홈"
        setting.title = "NEW & HOT"
        movie.title = "저장한 콘텐츠 목록"
        recommand.title = "연관된 영화"
        
        mainscreen.tabBarItem.image = UIImage.init(systemName: "house")
        setting.tabBarItem.image = UIImage.init(systemName: "magnifyingglass")
        movie.tabBarItem.image = UIImage.init(systemName: "book")
        recommand.tabBarItem.image = UIImage(systemName: "chevron.right")
        
        let navigationHome = UINavigationController(rootViewController: mainscreen)
        let navigationSetting = UINavigationController(rootViewController: setting)
        let navigationMovie = UINavigationController(rootViewController: movie)
        let navigationRecommand = UINavigationController(rootViewController: recommand)
        
        setViewControllers([navigationHome, navigationSetting, navigationMovie, navigationRecommand], animated: false)
    }
}
