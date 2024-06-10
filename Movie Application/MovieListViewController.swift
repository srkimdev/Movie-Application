//
//  otherViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/4/24.
//

import UIKit
import SnapKit
import Alamofire

class MovieListViewController: UIViewController {

    let movieTableView = UITableView()
    var movies1: [MovieInfo] = []
    var characters: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        callRequest1()
        
        
//        for item in movies1 {
//            callRequest2(id: item.id)
//        }
//        
//        print(characters)
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        movieTableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: MovieListTableViewCell.identifier)
        
    }
    
    func configureHierarchy() {
        
        view.addSubview(movieTableView)
        
    }

    func configureLayout() {
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }

    func configureUI() {
        
        view.backgroundColor = .white
        movieTableView.rowHeight = 430
        
        
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "book"), style: .plain, target: self, action: #selector(listButtonClicked))
        navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonClicked))
        
        navigationItem.rightBarButtonItem = rightItem
        
    }
    
    func callRequest1() {
            
        let url = "https://api.themoviedb.org/3/trending/movie/week?"
        
        let header: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWZlZDlhZDI4M2YwNmQ2OGM5MmQ0OGU5YjY5MzM1NSIsInN1YiI6IjY2NjU5YWJmYTJiNTYwOGZiOTEzODA3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DsjHLjeT2yEYwT6Jy_u8IZip2TJuqLKbigAjKaiz0jo",
            "accept": "application/json"
        ]
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: MovieTotal.self) { response in
            
            switch response.result {
            case .success(let value):
                
                print(value)
                self.movies1 = value.results
                self.movieTableView.reloadData()
               
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func callRequest2(id: Int) {
            
        let url = "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=f1fed9ad283f06d68c92d48e9b693355"
        
        let header: HTTPHeaders = [
            "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWZlZDlhZDI4M2YwNmQ2OGM5MmQ0OGU5YjY5MzM1NSIsInN1YiI6IjY2NjU5YWJmYTJiNTYwOGZiOTEzODA3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DsjHLjeT2yEYwT6Jy_u8IZip2TJuqLKbigAjKaiz0jo",
            "accept": "application/json"
        ]
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: MovieTotal2.self) { response in
            
            switch response.result {
            case .success(let value):
                print(value)
                let temp = value.cast
                var movie: [String] = []
                
                for item in temp {
                    movie.append(item.character)
                }
                
                self.characters.append(movie)
                
                self.movieTableView.reloadData()
               
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    @objc func searchButtonClicked() {
        
        
    }
    
    @objc func listButtonClicked() {
        
        
    }
    
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = movieTableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.identifier, for: indexPath) as! MovieListTableViewCell
        cell.separatorInset.left = 0.0
        
        let movie = movies1[indexPath.row]
//        let movie2 = movies2[indexPath.row]
        cell.designCell(transition: movie)
//        cell.designCell(transition: characters[indexPath.row])
        
        
        return cell
    }
    
}
