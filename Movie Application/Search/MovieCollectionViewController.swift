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
    
    let mainView = MovieCollectionView()
    
    var list = MovieSearch(
        total_pages: 0,
        results: []
    )
    
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.movieCollectionView.delegate = self
        mainView.movieCollectionView.dataSource = self
        mainView.movieCollectionView.prefetchDataSource = self
        
        mainView.searchBar.delegate = self

    }
    
    override func loadView() {
        view = mainView
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
                    callRequest(text: mainView.searchBar.text!)
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
                self.mainView.movieCollectionView.reloadData()
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
                            
            self.mainView.movieCollectionView.reloadData()
            
            if self.page == 1 && !self.list.results.isEmpty {
                self.mainView.movieCollectionView.scrollToItem(at: IndexPath(row: 0,section: 0),at: .top, animated: false)
            }
        }

    }
    
}

