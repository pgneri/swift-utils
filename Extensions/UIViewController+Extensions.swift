//
//  UIViewController+Extensions.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import UIKit

extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    static func initialViewController<T>(from storyboard: UIStoryboard) -> T {
        guard let viewController = storyboard.instantiateInitialViewController() as? T else {
            fatalError("ViewController is not type of \(T.self)")
        }
        return viewController
    }

    static func notNil<T>(_ viewController: UIViewController?) -> T {
        guard let viewController = viewController as? T else {
            fatalError("ViewController is not type of \(T.self) or is nil")
        }
        return viewController
    }
}
