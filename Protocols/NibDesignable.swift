//
//  NibDesignable.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import UIKit

protocol NibDesignable {
    func loadNib()
}

extension NibDesignable where Self: UIView {

    private func nibName() -> String {
        return type(of: self).description().components(separatedBy: ".").last!
    }

    func loadNib() {
        let bundle = Bundle(for: type(of: self))
        guard let view = UINib(nibName: nibName(), bundle: bundle)
            .instantiate(withOwner: self, options: .none).first as? UIView else {return}
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
