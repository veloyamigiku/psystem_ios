//
//  LoginView.swift
//  psystem_ios
//
//  Created by velo.yamigiku on 2020/04/09.
//

import UIKit

protocol LoginViewDelegate: class {
    func loginView(loginButtonDidTap view: LoginView)
    func loginView(signupButtonDidTap view: LoginView)
    func loginView(changeBottomUIMaxY y: CGFloat)
}

class LoginView: UIView {
    
    private var titleLabel: UILabel!
    private var userLabel: UILabel!
    private var userTextField: UITextField!
    private var passwordLabel: UILabel!
    private var passwordTextField: UITextField!
    private var loginButton: UIButton!
    private var signupButton: UIButton!
    
    var delegate: LoginViewDelegate!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // タイトルラベルを作成する。
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "ログイン";
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        addSubview(titleLabel)
        
        // ユーザ名のラベルを作成する。
        userLabel = UILabel()
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.text = "ユーザ名"
        //userLabel.textAlignment = .center
        userLabel.textColor = .black
        addSubview(userLabel)
        
        // ユーザ名入力項目を作成する。
        userTextField = UITextField()
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        userTextField.font = UIFont.systemFont(ofSize: 15)
        userTextField.borderStyle = UITextField.BorderStyle.roundedRect
        addSubview(userTextField)
        
        // パスワードのラベルを作成する。
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "パスワード"
        passwordLabel.textColor = .black
        addSubview(passwordLabel)
        
        // パスワード入力項目を作成する。
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.font = UIFont.systemFont(ofSize: 15)
        addSubview(passwordTextField)
        
        // ログインボタンを作成する。
        loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("ログイン", for: .normal)
        loginButton.setTitleColor(.systemBlue, for: .normal)
        loginButton.addTarget(
            self,
            action: #selector(tapLoginButton(_:)),
            for: .touchUpInside)
        addSubview(loginButton)
        
        // サインアップボタンを作成する。
        signupButton = UIButton()
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.setTitleColor(.systemBlue, for: .normal)
        signupButton.setTitle("サインアップ", for: UIControl.State.normal)
        signupButton.addTarget(
            self,
            action: #selector(tapSignupButton(_:)),
            for: .touchUpInside)
        addSubview(signupButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implements")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        addConstraints([
            Layout.constraint(item: titleLabel, .top, to: self, .top, constant: 50),
            Layout.constraint(item: titleLabel, .centerX, to: self, .centerX),
            Layout.constraint(item: titleLabel, .width, to: nil, .width, constant: 100),
            Layout.constraint(item: titleLabel, .height, to: nil, .height, constant: 50)
        ])
        
        addConstraints([
            Layout.constraint(item: userLabel, .top, to: titleLabel, .bottom, constant: 25),
            Layout.constraint(item: userLabel, .leading, to: self, .leading, constant: 20),
            Layout.constraint(item: userLabel, .width, to: nil, .width, constant: 100)
        ])
        
        addConstraints([
            Layout.constraint(item: userTextField, .top, to: titleLabel, .bottom, constant: 20),
            Layout.constraint(item: userTextField, .leading, to: userLabel, .trailing, constant: 10),
            Layout.constraint(item: userTextField, .width, to: nil, .width, constant: 150)
        ])
        
        addConstraints([
            Layout.constraint(item: passwordLabel, .top, to: userLabel, .bottom, constant: 25),
            Layout.constraint(item: passwordLabel, .leading, to: self, .leading, constant: 20),
            Layout.constraint(item: passwordLabel, .width, to: nil, .width, constant: 100)
        ])
        
        addConstraints([
            Layout.constraint(item: passwordTextField, .top, to: userLabel, .bottom, constant: 20),
            Layout.constraint(item: passwordTextField, .leading, to: passwordLabel, .trailing, constant: 10),
            Layout.constraint(item: passwordTextField, .width, to: nil, .width, constant: 150)
        ])
        
        addConstraints([
            Layout.constraint(item: loginButton, .top, to: passwordLabel, .bottom, constant: 50),
            Layout.constraint(item: loginButton, .leading, to: self, .leading, constant: 20),
            Layout.constraint(item: loginButton, .width, to: nil, .width, constant: 120)
        ])
        
        addConstraints([
            Layout.constraint(item: signupButton, .top, to: passwordLabel, .bottom, constant: 50),
            Layout.constraint(item: signupButton, .trailing, to: self, .trailing, constant: -20),
            Layout.constraint(item: signupButton, .width, to: nil, .width, constant: 120)
        ])
        
        delegate.loginView(changeBottomUIMaxY: signupButton.frame.size.height + signupButton.frame.origin.y)
        
    }
    
    @objc func tapSignupButton(_ sender: UIButton) {
        delegate.loginView(signupButtonDidTap: self)
    }
    
    @objc func tapLoginButton(_ sender: UIButton) {
        delegate.loginView(loginButtonDidTap: self)
    }

}
