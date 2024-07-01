//
//  ReusableProtocol.swift
//  Movie Application
//
//  Created by 김성률 on 6/10/24.
//

import UIKit

extension NSObjectProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}


