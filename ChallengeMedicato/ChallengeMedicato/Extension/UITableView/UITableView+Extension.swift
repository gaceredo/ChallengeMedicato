//
//  UITableView+Extension.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import UIKit

public extension UITableView {
    func hideFooterView() {
        self.tableFooterView = UIView(frame: .zero)
    }
}
