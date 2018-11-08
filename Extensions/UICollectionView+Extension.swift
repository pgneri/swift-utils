//
//  UICollectionView+Extension.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(_: T.Type) where T: Identifiable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Identifiable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }

        return cell
    }
}
