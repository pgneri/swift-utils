//
//  UIRectCorner+Extension.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import UIKit

extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let mask: CACornerMask = corners.maskedValue()
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = mask
        } else {
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [corners], cornerRadii: CGSize(width: radius, height: radius))
            let shapeLayer = CAShapeLayer()
            shapeLayer.frame = self.bounds
            shapeLayer.path = maskPath.cgPath
            self.layer.mask = shapeLayer
        }
    }
}

extension UIRectCorner {

    func maskedValue() -> CACornerMask {
        var maskedValue: CACornerMask = []

        if self.contains( .topLeft) {
            maskedValue.insert(.layerMinXMinYCorner)
        }
        if self.contains( .topRight) {
            maskedValue.insert(.layerMaxXMinYCorner)
        }
        if self.contains( .bottomLeft) {
            maskedValue.insert(.layerMinXMaxYCorner)
        }
        if self.contains( .bottomRight) {
            maskedValue.insert(.layerMaxXMaxYCorner)
        }
        if self.contains( .allCorners) {
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        return maskedValue
    }
}
