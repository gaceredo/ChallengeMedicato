//
//  ConfigurableCell.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import Foundation

public protocol ConfigurableCell: ReusableCell {
    associatedtype DataType
    func configure(data: DataType)
}
