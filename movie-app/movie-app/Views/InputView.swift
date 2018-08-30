//  InputView.swift
//  movie-app
//  Created by Anthony Washington on 8/29/18.
//  Copyright © 2018 Anthony Washington. All rights reserved.

import UIKit

class InputView: UIView {
    
    var inputTitle: String? {
        didSet {
            inputLabel.text = inputTitle
        }
    }
    
    let inputLabel: UILabel = {
        let input = UILabel()
        input.textColor = MAIN_GREY_CLR
        input.font = UIFont(name: LIGHT, size: 15) ??
            UIFont.systemFont(ofSize: 15, weight: .light)
        return input
    }()
    
    let inputBody: UITextField = {
        let input = UITextField()
        input.font = UIFont(name: MEDIUM, size: 15) ??
            UIFont.systemFont(ofSize: 15, weight: .medium)
        return input
    }()
    
    let divider : UIView = {
        let d = UIView()
        d.backgroundColor = OFF_GREY_COLOR
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [inputLabel, inputBody])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        addSubview(divider)
        
        stackView.anchors(top: topAnchor, topPad: 4, bttm: bottomAnchor, bttmPad: 4,
                          left: leftAnchor, leftPad: 8, right: rightAnchor, rightPad: 16)
        divider.anchors(top: stackView.bottomAnchor, topPad: 4, bttm: nil, bttmPad: 0,
                        left: stackView.leftAnchor, leftPad: 0, right: stackView.rightAnchor,
                        rightPad: 0, height: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

