//  RegisterController.swift
//  movie-app
//  Created by Anthony Washington on 8/28/18.
//  Copyright © 2018 Anthony Washington. All rights reserved.

import UIKit

class RegisterController: UIViewController {
    
    let header: UILabel = {
        let attributed = NSMutableAttributedString(string: "Register\n", attributes: [
            NSAttributedStringKey.font: UIFont.init(name: BOLD, size: 30) ??
            UIFont.boldSystemFont(ofSize: 30),
            NSAttributedStringKey.foregroundColor: MAIN_BLACK_CLR
        ])
        attributed.append(NSAttributedString(string: "Signup for a new account", attributes: [
            NSAttributedStringKey.font: UIFont.init(name: LIGHT, size: 20) ??
                UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor: MAIN_GREY_CLR
        ]))
        
        let h = UILabel()
            h.textAlignment = .center
            h.numberOfLines = 0
            h.attributedText = attributed
       return h
    }()
    
    let nameInput : InputView = {
        let n = InputView()
            n.inputTitle = "Your Name"
        return n
    }()
    
    let emailId : InputView = {
        let e = InputView()
            e.inputTitle = "Email"
        return e
    }()
    
    let inputPsswd : InputView = {
        let i = InputView()
            i.inputTitle = "Password"
            i.inputBody.isSecureTextEntry = true
        return i
    }()
    
    let confirmPsswd : InputView = {
        let c = InputView()
            c.inputTitle = "Confirm Password"
            c.inputBody.isSecureTextEntry = true
        return c
    }()
    
    let createAccountButton : UIButton = {
        let attributed = NSAttributedString(string:
            "Create Account", attributes: [
                NSAttributedStringKey.foregroundColor: UIColor.white,
                NSAttributedStringKey.font : UIFont(name: BOLD, size: 16) ??
                    UIFont.boldSystemFont(ofSize: 16),
            ])
        
        let c = UIButton(type: .system)
            c.setAttributedTitle(attributed, for: .normal)
            c.layer.cornerRadius = 20
            c.backgroundColor = MAIN_BLUE_CLR
        return c
    }()
    
    let loginUserButton : UIButton = {
        let h = UIButton(type: .system)
        let attributed = NSMutableAttributedString(
            attributedString: NSAttributedString(string:
                "Already a user?  ", attributes: [
                    NSAttributedStringKey.foregroundColor: MAIN_BLACK_CLR,
                    NSAttributedStringKey.font: UIFont(name: THIN, size: 16) ??
                        UIFont.boldSystemFont(ofSize: 16)
            ]))
            attributed.append(NSAttributedString(string:
                "Login now", attributes: [
                    NSAttributedStringKey.foregroundColor: MAIN_BLUE_CLR,
                    NSAttributedStringKey.font: UIFont(name: THIN, size: 16) ??
                        UIFont.boldSystemFont(ofSize: 16)
            ]))
        h.setAttributedTitle(attributed, for: .normal)
        h.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        return h
    }()

    fileprivate func configureInputViews() {
        let stackView = UIStackView(arrangedSubviews: [
            nameInput, emailId, inputPsswd, confirmPsswd
            ])
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually

        view.addSubview(stackView)
        stackView.centerYAxis(centerY: view.centerYAnchor)
        stackView.anchors(top: nil, topPad: 0, bttm: nil, bttmPad: 0, left: view.leftAnchor,
                          leftPad: 16, right: view.rightAnchor, rightPad: 16)
    }
    
    fileprivate func configureOtherViews() {
        view.addSubview(header)
        view.addSubview(createAccountButton)
        view.addSubview(loginUserButton)
        
        header.centerXAxis(centerX: view.centerXAnchor)
        createAccountButton.centerXAxis(centerX: view.centerXAnchor)
        loginUserButton.centerXAxis(centerX: view.centerXAnchor)
        
        header.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 32, bttm: nil,
                       bttmPad: 0, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor,
                       rightPad: 16, height: 75)
        createAccountButton.anchors(top: nil , topPad: 0, bttm: loginUserButton.topAnchor,
                                    bttmPad: 8, left: view.leftAnchor, leftPad: 48,
                                    right: view.rightAnchor, rightPad: 48, height: 45)
        loginUserButton.anchors(top: nil, topPad: 0, bttm: view.safeAreaLayoutGuide.bottomAnchor,
                                  bttmPad: 0, left: nil, leftPad: 0, right: nil, rightPad: 0, height: 35)
    }
    
    @objc func loginUser() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureInputViews()
        configureOtherViews()
    }
}
