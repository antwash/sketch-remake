///  Extensions.swift
//  movie-app
//  Created by Anthony Washington on 8/28/18.
//  Copyright © 2018 Anthony Washington. All rights reserved.

import UIKit

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) -> UIColor {
        return UIColor.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
}


extension UIView {
    
    func widthAnchor(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if width > 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    
    func heightAnchor(height: CGFloat = 0.0) {
        if height > 0 {
            translatesAutoresizingMaskIntoConstraints = false
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerXAxis(centerX: NSLayoutXAxisAnchor?) {
        if let centerX = centerX {
            translatesAutoresizingMaskIntoConstraints = false
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
    }
    
    func centerYAxis(centerY: NSLayoutYAxisAnchor?) {
        if let centerY = centerY {
            translatesAutoresizingMaskIntoConstraints = false
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func anchors(top: NSLayoutYAxisAnchor?, topPad: CGFloat,
                 bttm: NSLayoutYAxisAnchor?, bttmPad: CGFloat,
                 left: NSLayoutXAxisAnchor?, leftPad: CGFloat,
                 right: NSLayoutXAxisAnchor?, rightPad: CGFloat,
                 height: CGFloat = 0.0, width: CGFloat = 0.0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topPad).isActive = true
        }
        
        if let bttm = bttm {
            bottomAnchor.constraint(equalTo: bttm, constant: -bttmPad).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftPad).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightPad).isActive = true
        }
        
        if height > 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if width > 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
