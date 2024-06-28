//
//  RecommandMovieViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/24/24.


import UIKit
import SnapKit
import Alamofire

class RecommandMovieViewController: BaseViewController {

    let movieTitle = UILabel()
    let category = ["추천 영화", "비슷한 영화"]

    lazy var movieTableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(RecommandMovieTableViewCell.self, forCellReuseIdentifier: RecommandMovieTableViewCell.identifier)
        view.rowHeight = 190
        view.backgroundColor = .black
        return view
    }()
    
    var imageList: [[RecommandKind]] = [[RecommandKind(poster_path: "")],
                                        [RecommandKind(poster_path: "")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let group = DispatchGroup()
//        
//        group.enter()
//        DispatchQueue.global().async(group: group) {
//            TMDBAPI.shared.communication(api: APIRequest.similar(query: "710295")) { value in
//                var filterList: [RecommandKind] = []
//            
//                for i in value {
//                    filterList.append(i)
//                }
//                self.imageList[0] = filterList
//                
//                group.leave()
//                
//            } errorHandler: { value in
//                print(value)
//            }
//
//        }
//        
//        group.enter()
//        DispatchQueue.global().async(group: group) {
//            TMDBAPI.shared.communicationRe(api: APIRequest.recommand(query: "940721")) { value in
//                var filterList: [RecommandKind] = []
//                
//                for i in value {
//                    filterList.append(i)
//                }
//                self.imageList[1] = filterList
//                
//                group.leave()
//                
//            } errorHandler: { value in
//                print(value)
//            }
//
//        }
//        
//        group.notify(queue: .main) {
//            self.movieTableView.reloadData()
//        }
        
    }
    
    override func configureHierarchy() {
        
        view.addSubview(movieTitle)
        view.addSubview(movieTableView)
        
    }
    
    override func configureLayout() {
        
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.height.equalTo(30)
        }
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(8)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    override func configureUI() {
        
        view.backgroundColor = .black
        
        movieTitle.text = "극한직업"
        movieTitle.textColor = .white
        movieTitle.font = .systemFont(ofSize: 25, weight: .bold)
        
        movieTableView.backgroundColor = .black
        
    }

}

extension RecommandMovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = movieTableView.dequeueReusableCell(withIdentifier: RecommandMovieTableViewCell.identifier, for: indexPath) as! RecommandMovieTableViewCell
        
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

}
