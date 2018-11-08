//
//  UITableView+Extension.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError()
        }

        return cell
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: Identifiable {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue header/footer with identifier: \(T.identifier)")
        }

        return cell
    }

    func register<T: UITableViewCell>(_: T.Type) where T: Identifiable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.identifier)
    }

    func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: Identifiable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
}
