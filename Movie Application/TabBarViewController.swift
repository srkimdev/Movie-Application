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
        let recommend = RecommandMovieViewController()
        
        home.title = "홈"
        setting.title = "NEW & HOT"
        movieList.title = "저장한 콘텐츠 목록"
        recommend.title = "연관된 영화"
        
        home.tabBarItem.image = UIImage.init(systemName: "house")
        setting.tabBarItem.image = UIImage.init(systemName: "magnifyingglass")
        movieList.tabBarItem.image = UIImage.init(systemName: "book")
        recommend.tabBarItem.image = UIImage(systemName: "chevron.right")
        
        let navigationHome = UINavigationController(rootViewController: home)
        let navigationSetting = UINavigationController(rootViewController: setting)
        let navigationMovie = UINavigationController(rootViewController: movieList)
        let navigationRecommend = UINavigationController(rootViewController: recommend)
        
        setViewControllers([navigationHome, navigationSetting, navigationMovie, navigationRecommend], animated: false)
    }
}
