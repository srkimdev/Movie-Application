//
//  WebViewController.swift
//  Movie Application
//
//  Created by 김성률 on 7/1/24.
//

import UIKit

class WebViewController: BaseViewController {

    let mainView = YouTubeWebView()
    
    var data: String?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.youtube.com/watch?v=" + (data ?? ""))!
        let request = URLRequest(url: url)
        mainView.website.load(request)
        
    }
    
}
