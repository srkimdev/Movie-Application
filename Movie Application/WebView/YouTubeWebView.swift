//
//  WebView.swift
//  Movie Application
//
//  Created by 김성률 on 7/1/24.
//

import UIKit
import WebKit
import SnapKit

final class YouTubeWebView: BaseView {
    
    let website = WKWebView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func configureHierarchy() {
        addSubview(website)
    }
    
    override func configureLayout() {
        website.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
