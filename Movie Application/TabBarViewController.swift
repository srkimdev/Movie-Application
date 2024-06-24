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
        let collection = MovieCollectionViewController()
        let recommand = RecommandMovieViewController()
        
        mainscreen.title = "홈"
        setting.title = "NEW & HOT"
        movie.title = "저장한 콘텐츠 목록"
        collection.title = "영화 검색"
        
        mainscreen.tabBarItem.image = UIImage.init(systemName: "house")
        setting.tabBarItem.image = UIImage.init(systemName: "magnifyingglass")
        movie.tabBarItem.image = UIImage.init(systemName: "book")
        collection.tabBarItem.image = UIImage.init(systemName: "plus")
        
        let navigationHome = UINavigationController(rootViewController: mainscreen)
        let navigationSetting = UINavigationController(rootViewController: setting)
        let navigationMovie = UINavigationController(rootViewController: movie)
        let navigationCollection = UINavigationController(rootViewController: collection)
        let navigationRecommand = UINavigationController(rootViewController: recommand)
        
        setViewControllers([navigationHome, navigationSetting, navigationMovie, navigationCollection, navigationRecommand], animated: false)
    }
}
