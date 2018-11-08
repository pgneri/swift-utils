//
//  KeyboardHandler.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import UIKit

@objc
protocol KeyboardHandler {
    weak var scrollView: UIScrollView! { get set }
}

extension KeyboardHandler where Self: UIViewController {

    func startObservingKeyboardChanges() {

        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil)
        { [weak self] notification in
            self?.keyboardWillShow(notification)
        }

        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil)
        { [weak self] notification in
            self?.keyboardWillHide(notification)
        }
    }

    func stopedObservingKeyboardChanges() {
        NotificationCenter.default.removeObserver(self)
    }

    func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }

        let height = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect).size.height

        scrollView.contentInset.bottom = height
        scrollView.scrollIndicatorInsets.bottom = height
    }

    func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset.bottom = 0
        scrollView.scrollIndicatorInsets.bottom = 0
    }
}
