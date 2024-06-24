//
//  ReusableProtocol.swift
//  Movie Application
//
//  Created by 김성률 on 6/10/24.
//

import UIKit

protocol ReusableProtocol {
    
    static var identifier: String { get }
    
}

extension UITableViewCell: ReusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
}


extension UIViewController: ReusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

