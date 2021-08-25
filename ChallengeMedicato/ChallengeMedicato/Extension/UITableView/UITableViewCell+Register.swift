//
//  UITableViewCell+Register.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import UIKit

public extension UITableView {
    func registerNib<T: UITableViewCell>(_: T.Type) where T: ReusableCell {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.xibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableaCell<T>(forIndexPath indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
}
