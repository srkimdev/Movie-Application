//
//  RecommandMovieViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/24/24.


import UIKit
import SnapKit
import Alamofire

class RecommandMovieViewController: BaseViewController {

    let category = ["추천 영화", "비슷한 영화", "포스터"]
    var data: titleID?
    
    var imageList: [[RecommandKind]] = [[RecommandKind(id: 0, poster_path: "")],
                                        [RecommandKind(id: 0, poster_path: "")]
                                        /*[posterID(file_path: "")]*/]
    
    let mainView = RecommendCollectionView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.movieTableView.delegate = self
        mainView.movieTableView.dataSource = self
        
        guard let data = data else { return }

        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPI.shared.communication(api: APIRequest.recommand(query: data.id), model: RecommandMovie.self) { value, error in
                
                print(value)
                guard let value = value else { return }
    
                self.imageList[0] = value.results
            
                group.leave()
            }
        }
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPI.shared.communication(api: APIRequest.similar(query: data.id), model: RecommandMovie.self) { value, error in
                
                guard let value = value else { return }
                
                self.imageList[1] = value.results
            
                group.leave()
            }
            
        }
        
//        group.enter()
//        DispatchQueue.global().async(group: group) {
//            TMDBAPI.shared.communication(api: APIRequest.poster(query: data.id), model: TotalPoster.self) { value, error in
//                
//                guard let value = value else {
//                    
//                    group.leave()
//                    return }
//                
//                self.imageList[2] = value.backdrops
//            
//                group.leave()
//            }
//        }
        
        group.notify(queue: .main) {
            self.mainView.movieTableView.reloadData()
        }
        
    }
    
    override func configureUI() {
        mainView.movieTitle.text = data?.title
    }
    
}

extension RecommandMovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainView.movieTableView.dequeueReusableCell(withIdentifier: RecommandMovieTableViewCell.identifier, for: indexPath) as! RecommandMovieTableViewCell
        
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        cell.collectionView.tag = indexPath.row
        cell.collectionView.register(RecommandMovieCollectionViewCell.self, forCellWithReuseIdentifier: RecommandMovieCollectionViewCell.identifier)
        cell.collectionView.reloadData()
        
        cell.designCell(text: category[indexPath.row])
        
        return cell
    }
    
}

extension RecommandMovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageList[collectionView.tag].count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandMovieCollectionViewCell.identifier, for: indexPath) as! RecommandMovieCollectionViewCell
        
        let data = imageList[collectionView.tag][indexPath.item]
        
        cell.designCell(transition: data)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = WebViewController()
        
        
        TMDBAPI.shared.communication(api: APIRequest.video(query: imageList[collectionView.tag][indexPath.item].id!), model: Video.self) { value, error in
            
            DispatchQueue.main.async {
                guard let value = value else { return }
                
                vc.data = value.results[indexPath.item].key
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}
