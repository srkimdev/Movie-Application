//
//  MovieInfoViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/12/24.
//

import UIKit
import SnapKit
import Kingfisher

class MovieInfoViewController: BaseViewController {

    let movieBackground = UIImageView()
    let movieTitle = UILabel()
    let moviePoster = UIImageView()
    let movieInfoTableView = UITableView()
    
    var list: MovieInfo
    var list2: [MovieInfo2]
    
    init(list: MovieInfo, list2: [MovieInfo2]) {
        self.list = list
        self.list2 = list2
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieInfoTableView.delegate = self
        movieInfoTableView.dataSource = self
        movieInfoTableView.register(MovieInfoTableViewCell.self, forCellReuseIdentifier: MovieInfoTableViewCell.identifier)
        movieInfoTableView.register(MovieInfo2TableViewCell.self, forCellReuseIdentifier: MovieInfo2TableViewCell.identifier)

    }
    
    override func configureHierarchy() {
        
        view.addSubview(movieBackground)
        movieBackground.addSubview(movieTitle)
        movieBackground.addSubview(moviePoster)
        view.addSubview(movieInfoTableView)
        
    }
    
    override func configureLayout() {
        
        movieBackground.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(180)
        }
        
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(movieBackground.snp.top).offset(20)
            make.leading.equalTo(movieBackground.snp.leading).offset(20)
            make.trailing.equalTo(movieBackground.snp.trailing)
            make.height.equalTo(30)
            
        }
        
        moviePoster.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(8)
            make.leading.equalTo(movieBackground.snp.leading).offset(24)
            make.width.equalTo(90)
            make.bottom.equalTo(movieBackground.snp.bottom).offset(-8)
        }
        
        movieInfoTableView.snp.makeConstraints { make in
            make.top.equalTo(movieBackground.snp.bottom)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
    }
    
    override func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "출연/제작"
        let item = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonClicked))
        item.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = item
        
        movieBackground.backgroundColor = .lightGray
        var url = URL(string: "https://image.tmdb.org/t/p/w780" + list.backdrop_path)
        movieBackground.kf.setImage(with: url)
        
        movieTitle.text = list.title
        movieTitle.textColor = .white
        movieTitle.font = .boldSystemFont(ofSize: 24)
        
        url = URL(string: "https://image.tmdb.org/t/p/w780" + list.poster_path)
        moviePoster.kf.setImage(with: url)
        
    }
    
    @objc func plusButtonClicked(sender: UIButton) {
        
        if let cell = sender.superview?.superview as? MovieInfo2TableViewCell {
            cell.toggle = !cell.toggle
            print(cell.toggle)
            cell.overViewLabel.numberOfLines = cell.toggle ? 2 : 0
            let imageName = cell.toggle ? "chevron.down" : "chevron.up"
            cell.plusButton.setImage(UIImage(systemName: imageName), for: .normal)
            movieInfoTableView.reloadData()
        }
    }
    
    @objc func backButtonClicked() {
        
        navigationController?.popViewController(animated: true)
        
    }

}

extension MovieInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return 10
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if section == 0 {
                return "OverView"
            } else {
                return "Cast"
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        if indexPath.section == 0 {
            
            let cell = movieInfoTableView.dequeueReusableCell(withIdentifier: MovieInfo2TableViewCell.identifier, for: indexPath) as! MovieInfo2TableViewCell
            
            cell.designCell(transition: list)
            cell.plusButton.addTarget(self, action: #selector(plusButtonClicked), for: .touchUpInside)
            cell.plusButton.tag = indexPath.row
            
            return cell
            
        } else {
            
            let cell = movieInfoTableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.identifier, for: indexPath) as! MovieInfoTableViewCell
            
            cell.designCell(transition: list2[indexPath.row])
            
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 80
        }
    }
    
    
}
