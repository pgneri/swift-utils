//
//  UIView+Extensions.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import UIKit

extension UIView {

    func configureGradient(with colors: [CGColor]) {
        let gl = CAGradientLayer()
        gl.frame = bounds
        gl.colors = colors
        gl.startPoint = .zero
        gl.endPoint = .init(x: 0, y: 1)
        
        self.layer.insertSublayer(gl, at: 0)
    }
}
