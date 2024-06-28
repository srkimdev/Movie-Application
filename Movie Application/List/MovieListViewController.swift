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

    let movieTableView = UITableView()
    
    var weekMovieInfoList: [weekMovieInfo] = []
    var detailMovieList: [[detailMovieInfo]] = []
    
    var characters: [[String]] = [] {
        didSet {
            movieTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: MovieListTableViewCell.identifier)
        
        callRequest1()
        
    }
    
    override func configureHierarchy() {
        view.addSubview(movieTableView)
    }

    override func configureLayout() {
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }

    override func configureUI() {
        
        view.backgroundColor = .white
        movieTableView.rowHeight = 430
        movieTableView.separatorStyle = .none
        
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "book"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonClicked))
        navigationItem.rightBarButtonItem = rightItem
        
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
        
        let cell = movieTableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.identifier, for: indexPath) as! MovieListTableViewCell
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
            self.movieTableView.reloadData()
        }
    }
}
