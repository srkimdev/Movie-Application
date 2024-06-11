//
//  MovieCollectionViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/11/24.
//

import UIKit
import SnapKit
import Alamofire

class MovieCollectionViewController: UIViewController {

    lazy var movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    let searchBar = UISearchBar()
    
    var list = MovieSearch(total_pages: 0, results: [])
    var page = 1
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(width: width/3, height: 150)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.prefetchDataSource = self
        movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        searchBar.delegate = self
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    func configureHierarchy() {
        
        view.addSubview(searchBar)
        view.addSubview(movieCollectionView)
    }
    
    func configureLayout() {
        
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        movieCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        searchBar.placeholder = "영화 제목을 검색해보세요."
        
    }
    
    func callRequest(text: String) {
        
        let url = "https://api.themoviedb.org/3/search/movie?query=\(text)&page=\(page)"
        
        let header: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWZlZDlhZDI4M2YwNmQ2OGM5MmQ0OGU5YjY5MzM1NSIsInN1YiI6IjY2NjU5YWJmYTJiNTYwOGZiOTEzODA3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DsjHLjeT2yEYwT6Jy_u8IZip2TJuqLKbigAjKaiz0jo",
            "accept": "application/json"
        ]
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: MovieSearch.self) { response in
            
            switch response.result {
                
            case .success(let value):

                var filterList = [MoviePoster]()
                
                if self.page == 1 {
                    
                    for i in value.results {
                        if i.poster_path != nil {
                            filterList.append(i)
                        }
                    }
                    self.list.results = filterList
                } else {
                    
                    for i in value.results {
                        if i.poster_path != nil {
                            filterList.append(i)
                        }
                    }
                    self.list.results.append(contentsOf: filterList)
                }
                
                self.movieCollectionView.reloadData()
                
                if self.page == 1 {
                    self.movieCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                }
            
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
}

extension MovieCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        
        let data = list.results[indexPath.row]
        if data != nil {
            cell.designCell(transition: data)
        }

        return cell
    }
    
}

extension MovieCollectionViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for item in indexPaths {
            if list.results.count - 2 == item.row {
                page += 1
                if list.total_pages != page {
                    callRequest(text: searchBar.text!)
                }
                
            }
            
        }
        
    }
    
    
}

extension MovieCollectionViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        page = 1
        callRequest(text: searchBar.text!)

    }
    
}

