//
//  MovieInfoViewController.swift
//  Movie Application
//
//  Created by 김성률 on 6/12/24.
//

import UIKit
import SnapKit
import Kingfisher

final class MovieInfoViewController: BaseViewController {

    var list: weekMovieInfo
    var list2: [detailMovieInfo]
    
    let mainView = MovieInfoView()
    
    init(list: weekMovieInfo, list2: [detailMovieInfo]) {
        self.list = list
        self.list2 = list2
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.movieInfoTableView.delegate = self
        mainView.movieInfoTableView.dataSource = self

    }
    
    override func configureUI() {
        navigationItem.title = "출연/제작"
        
        let item = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonClicked))
        item.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = item
        
        var url = URL(string: "https://image.tmdb.org/t/p/w780" + list.backdrop_path)
        mainView.movieBackground.kf.setImage(with: url)
        
        url = URL(string: "https://image.tmdb.org/t/p/w780" + list.poster_path)
        mainView.moviePoster.kf.setImage(with: url)
        
        mainView.movieTitle.text = list.title
    }
    
    @objc func plusButtonClicked(sender: UIButton) {
        
        if let cell = sender.superview?.superview as? MovieInfo2TableViewCell {
            cell.toggle = !cell.toggle
            cell.overViewLabel.numberOfLines = cell.toggle ? 2 : 0
            
            let imageName = cell.toggle ? "chevron.down" : "chevron.up"
            cell.plusButton.setImage(UIImage(systemName: imageName), for: .normal)
            mainView.movieInfoTableView.reloadData()
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
            return list2.count
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
            
            let cell = mainView.movieInfoTableView.dequeueReusableCell(withIdentifier: MovieInfo2TableViewCell.identifier, for: indexPath) as! MovieInfo2TableViewCell
            
            cell.designCell(transition: list)
            cell.plusButton.addTarget(self, action: #selector(plusButtonClicked), for: .touchUpInside)
            cell.plusButton.tag = indexPath.row
            
            return cell
            
        } else {
            
            let cell = mainView.movieInfoTableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.identifier, for: indexPath) as! MovieInfoTableViewCell
            
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
