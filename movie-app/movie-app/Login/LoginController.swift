//  LoginController.swift
//  movie-app
//  Created by Anthony Washington on 9/1/18.
//  Copyright © 2018 Anthony Washington. All rights reserved.


import UIKit

class LoginController : UIViewController {
    
    let header: UILabel = {
        let attributed = NSMutableAttributedString(string: "Login\n", attributes: [
            NSAttributedStringKey.font: UIFont.init(name: BOLD, size: 30) ??
                UIFont.boldSystemFont(ofSize: 30),
            NSAttributedStringKey.foregroundColor: MAIN_BLACK_CLR
            ])
        attributed.append(NSAttributedString(string: "Signin to your account to continue", attributes: [
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
    
    let forgotPsswd : UIButton = {
        let f = UIButton(type: .system)
            f.setTitle("Forgot password?", for: .normal)
            f.setTitleColor(MAIN_BLUE_CLR, for: .normal)
            f.titleLabel?.font = UIFont.init(name: LIGHT, size: 15) ??
                UIFont.systemFont(ofSize: 15, weight: .light)
        return f
    }()
    
    let loginButton : UIButton = {
        let attributed = NSAttributedString(string:
            "Login", attributes: [
                NSAttributedStringKey.foregroundColor: UIColor.white,
                NSAttributedStringKey.font : UIFont(name: BOLD, size: 16) ??
                    UIFont.boldSystemFont(ofSize: 16),
                ])
        
        let l = UIButton(type: .system)
        l.setAttributedTitle(attributed, for: .normal)
        l.layer.cornerRadius = 20
        l.backgroundColor = MAIN_BLUE_CLR
        return l
    }()
    
    let signUpButton : UIButton = {
        let h = UIButton(type: .system)
        let attributed = NSMutableAttributedString(
            attributedString: NSAttributedString(string:
                "Don't have an account?  ", attributes: [
                    NSAttributedStringKey.foregroundColor: MAIN_BLACK_CLR,
                    NSAttributedStringKey.font: UIFont(name: THIN, size: 16) ??
                        UIFont.systemFont(ofSize: 16, weight: .light)
                ]))
        attributed.append(NSAttributedString(string:
            "Sign Up", attributes: [
                NSAttributedStringKey.foregroundColor: MAIN_BLUE_CLR,
                NSAttributedStringKey.font: UIFont(name: THIN, size: 16) ??
                    UIFont.systemFont(ofSize: 16, weight: .light)
            ]))
        h.setAttributedTitle(attributed, for: .normal)
        h.addTarget(self, action: #selector(signUpUser), for: .touchUpInside)
        return h
    }()
    
    fileprivate func configureInputViews() {
        let stackView = UIStackView(arrangedSubviews: [emailId, inputPsswd] )
            stackView.spacing = 20
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        view.addSubview(forgotPsswd)

        stackView.centerYAxis(centerY: view.centerYAnchor)
        stackView.anchors(top: nil, topPad: 0, bttm: nil, bttmPad: 0,
                          left: view.leftAnchor, leftPad: 16, right: view.rightAnchor,
                          rightPad: 16)
        forgotPsswd.anchors(top: stackView.bottomAnchor, topPad: 4, bttm: nil, bttmPad: 0,
                            left: nil, leftPad: 0, right: stackView.rightAnchor, rightPad: 32, height: 40)
    }
    
    fileprivate func configureOtherViews() {
        view.addSubview(header)
        view.addSubview(signUpButton)
        view.addSubview(loginButton)
        
        header.centerXAxis(centerX: view.centerXAnchor)
        signUpButton.centerXAxis(centerX: view.centerXAnchor)
        loginButton.centerXAxis(centerX: view.centerXAnchor)
        
        header.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 32, bttm: nil,
                       bttmPad: 0, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor,
                       rightPad: 16, height: 75)
        signUpButton.anchors(top: nil, topPad: 0, bttm: view.safeAreaLayoutGuide.bottomAnchor,
                                  bttmPad: 0, left: nil, leftPad: 0, right: nil, rightPad: 0, height: 35)
        loginButton.anchors(top: nil, topPad: 0, bttm: signUpButton.topAnchor, bttmPad: 8, left: view.leftAnchor,
                            leftPad: 48, right: view.rightAnchor, rightPad: 48, height: 45)
    }
    
    
    @objc func signUpUser() {
        let registerUserController = RegisterController()
        navigationController?.pushViewController(registerUserController, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden  = true
        view.backgroundColor = .white
        configureOtherViews()
        configureInputViews()
    }
}
