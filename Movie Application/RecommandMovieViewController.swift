//
//  RecommandMovieViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/24/24.
//

import UIKit
import SnapKit
import Alamofire

class RecommandMovieViewController: UIViewController {

    let movieTitle = UILabel()
    let similarMovieTitle = UILabel()
    let recommandMovieTitle = UILabel()
    
    lazy var similarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    lazy var recommandCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 104, height: 150)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        return layout
    }
    
    var page = 1
    var list1: [String] = []
    var list2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        similarCollectionView.dataSource = self
        similarCollectionView.delegate = self
        
        recommandCollectionView.dataSource = self
        recommandCollectionView.delegate = self
        
        similarCollectionView.register(RecommandMovieCollectionViewCell.self, forCellWithReuseIdentifier: RecommandMovieCollectionViewCell.identifier)
        recommandCollectionView.register(RecommandMovieCollectionViewCell.self, forCellWithReuseIdentifier: RecommandMovieCollectionViewCell.identifier)
        
        callRequest(urlString: "similar") { value in
            var filterList: [String] = []
            
            for i in value.results! {
                filterList.append(i.poster_path ?? "")
            }
            self.list1 = filterList

            self.similarCollectionView.reloadData()

        }
        
        callRequest(urlString: "recommand") { value in
            var filterList: [String] = []
        
            for i in value.results! {
                filterList.append(i.poster_path ?? "")
            }
            self.list2 = filterList
            
            self.recommandCollectionView.reloadData()

        }
    }
    
    func configureHierarchy() {
        
        view.addSubview(movieTitle)
        view.addSubview(similarMovieTitle)
        view.addSubview(similarCollectionView)
        view.addSubview(recommandMovieTitle)
        view.addSubview(recommandCollectionView)
        
    }
    
    func configureLayout() {
        
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.height.equalTo(30)
        }
        
        similarMovieTitle.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.height.equalTo(24)
        }
        
        similarCollectionView.snp.makeConstraints { make in
            make.top.equalTo(similarMovieTitle.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(160)
        }
        
        recommandMovieTitle.snp.makeConstraints { make in
            make.top.equalTo(similarCollectionView.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.height.equalTo(24)
        }
        
        recommandCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recommandMovieTitle.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(160)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = .black
        
        movieTitle.text = "극한직업"
        movieTitle.textColor = .white
        movieTitle.font = .systemFont(ofSize: 25, weight: .bold)
        
        similarMovieTitle.text = "비슷한 영화"
        similarMovieTitle.textColor = .white
        similarMovieTitle.font = .systemFont(ofSize: 20, weight: .bold)
        
        similarCollectionView.backgroundColor = .red
        
        recommandMovieTitle.text = "추천 영화"
        recommandMovieTitle.textColor = .white
        recommandMovieTitle.font = .systemFont(ofSize: 20, weight: .bold)
        
        recommandCollectionView.backgroundColor = .blue
        
    }
    
    func callRequest(urlString: String, completionHandler: @escaping (RecommandMovie) -> Void) {
        
        var url = ""
        
        if urlString == "similar" {
            url = "https://api.themoviedb.org/3/movie/710295/similar"
        } else {
            url = "https://api.themoviedb.org/3/movie/940721/recommendations"
        }
        
        let header: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWZlZDlhZDI4M2YwNmQ2OGM5MmQ0OGU5YjY5MzM1NSIsInN1YiI6IjY2NjU5YWJmYTJiNTYwOGZiOTEzODA3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DsjHLjeT2yEYwT6Jy_u8IZip2TJuqLKbigAjKaiz0jo",
            "accept": "application/json"
        ]

        AF.request(url, method: .get, headers: header).responseDecodable(of: RecommandMovie.self) { response in
            
            switch response.result {
                
            case .success(let value):
                completionHandler(value)
            
            case .failure(let error):
                print(error)
            }
        }
        
    }

}

extension RecommandMovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == similarCollectionView {
            return list1.count
        } else {
            return list2.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == similarCollectionView {
            let cell = similarCollectionView.dequeueReusableCell(withReuseIdentifier: RecommandMovieCollectionViewCell.identifier, for: indexPath) as! RecommandMovieCollectionViewCell
            
            cell.designCell(transition: list1[indexPath.item])
            
            return cell
        } else {
            
            let cell = recommandCollectionView.dequeueReusableCell(withReuseIdentifier: RecommandMovieCollectionViewCell.identifier, for: indexPath) as! RecommandMovieCollectionViewCell
            
            cell.designCell(transition: list2[indexPath.item])
            
            return cell
        }
        
        
    }

}
