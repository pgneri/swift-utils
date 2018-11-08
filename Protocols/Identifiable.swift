//
//  Identifiable.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import UIKit

protocol Identifiable {}

extension Identifiable where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
