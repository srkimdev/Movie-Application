//
//  otherViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/4/24.
//

import UIKit
import SnapKit
import Alamofire

class MovieListViewController: BaseViewController {
    
    var weekMovieInfoList: [weekMovieInfo] = []
    var detailMovieList: [[detailMovieInfo]] = []
    
    var characters: [[String]] = [] {
        didSet {
            mainView.movieTableView.reloadData()
        }
    }
    
    let mainView = MovieListView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "book"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonClicked))
        navigationItem.rightBarButtonItem = rightItem
        
        mainView.movieTableView.delegate = self
        mainView.movieTableView.dataSource = self
        mainView.movieTableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: MovieListTableViewCell.identifier)
        
        callRequest1()
        
    }
    
    @objc func nextButtonClicked(sender: UIButton) {
        let vc = MovieInfoViewController(list: weekMovieInfoList[sender.tag], list2: detailMovieList[sender.tag])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func searchButtonClicked() {
        let vc = MovieCollectionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainView.movieTableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.identifier, for: indexPath) as! MovieListTableViewCell
        cell.separatorInset.left = 0.0
        
        let movie = weekMovieInfoList[indexPath.row]
        cell.nextButton.tag = indexPath.row
        cell.nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        
        cell.designCell(transition: movie)
        cell.designCell(transition: characters[indexPath.row])
        
        return cell
    }
    
}

extension MovieListViewController {
    
    func callRequest1() {
        
        TMDBAPI.shared.communication(api: APIRequest.firstInfo, model: weekMovie.self) { value, error in
            
            guard let value = value else { return }
            
            self.weekMovieInfoList = value.results
            
            for item in self.weekMovieInfoList {
                self.callRequest2(id: item.id)
            }
        }
    }
    
    func callRequest2(id: Int) {
        
        TMDBAPI.shared.communication(api: APIRequest.secondInfo(id: id), model: detailMovie.self) { value, error in
            
            guard let value = value else { return }
            
            let temp = value.cast
            self.detailMovieList.append(temp)
            
            var movie: [String] = []

            for item in temp {
                movie.append(item.character)
            }
           
            self.characters.append(movie)
            self.mainView.movieTableView.reloadData()
        }
    }
}
