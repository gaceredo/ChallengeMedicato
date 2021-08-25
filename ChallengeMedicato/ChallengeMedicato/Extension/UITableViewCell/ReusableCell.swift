//
//  ReusableCell.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import Foundation

public protocol ReusableCell {
    static var reuseIdentifier: String { get }
    static var xibName: String { get }
}

public extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    static var xibName: String {
        return String(describing: self).components(separatedBy: ".").last ?? ""
    }
}
