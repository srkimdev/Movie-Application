//
//  MovieCollectionViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/11/24.
//

import UIKit
import SnapKit
import Alamofire

class MovieCollectionViewController: BaseViewController {

    lazy var movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    let searchBar = UISearchBar()
    
    var list = MovieSearch(
        total_pages: 0,
        results: []
    )
    
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

    }
    
    override func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(movieCollectionView)
    }
    
    override func configureLayout() {
        
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
    
    override func configureUI() {
        view.backgroundColor = .white
        searchBar.placeholder = "영화 제목을 검색해보세요."
    }
    
}

extension MovieCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        
        let data = list.results[indexPath.item]
        
        cell.designCell(transition: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = RecommandMovieViewController()
        let data = titleID(title: list.results[indexPath.item].title, id: list.results[indexPath.item].id)
        vc.data = data
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MovieCollectionViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for item in indexPaths {
            if list.results.count - 4 == item.item {
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

extension MovieCollectionViewController {
    
    func callRequest(text: String) {
        
        TMDBAPI.shared.communication(api: APIRequest.search(query: text, page: page), model: MovieSearch.self) { value, error in
            
            guard let value = value else {
                self.list.results = []
                self.movieCollectionView.reloadData()
                return
            }
            
            self.list.total_pages = value.total_pages
            var filterList: [MoviePoster] = []
            
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
            
            if self.page == 1 && !self.list.results.isEmpty {
                self.movieCollectionView.scrollToItem(at: IndexPath(row: 0,section: 0),at: .top, animated: false)
            }
        }

    }
    
}

