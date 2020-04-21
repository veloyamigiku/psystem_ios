//
//  ViewController.swift
//  psystem_ios
//
//  Created by velo.yamigiku on 2020/04/09.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.title = "ログイン"
        
        deployComponent()
        
    }
    
    func deployComponent() {
        
        // スクロールビューを作成する。
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // ログインビューを作成する。
        loginView = LoginView()
        loginView.delegate = self
        scrollView.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func viewDidLayoutSubviews() {
        
        scrollView.contentSize.width = self.view.frame.size.width
        self.view.addConstraints([
            Layout.constraint(item: scrollView, .top, to: self.view, .top),
            Layout.constraint(item: scrollView, .bottom, to: self.view, .bottom),
            Layout.constraint(item: scrollView, .leading, to: self.view, .leading),
            Layout.constraint(item: scrollView, .trailing, to: self.view, .trailing)
        ])
        
        scrollView.addConstraints([
            Layout.constraint(item: loginView, .top, to: scrollView, .top),
            Layout.constraint(item: loginView, .bottom, to: scrollView, .bottom),
            Layout.constraint(item: loginView, .leading, to: scrollView, .leading),
            Layout.constraint(item: loginView, .trailing, to: scrollView, .trailing),
            Layout.constraint(item: loginView, .width, to: scrollView, .width),
            Layout.constraint(item: loginView, .height, to: scrollView, .height)
        ])
        
    }
    
}

extension ViewController: LoginViewDelegate {
    
    func loginView(loginButtonDidTap view: LoginView) {
        print("LoginViewDelegate.loginButtonDidTap")
    }
    
    func loginView(signupButtonDidTap view: LoginView) {
        print("LoginViewDelegate.signupButtonDidTap")
    }
    
    func loginView(changeBottomUIMaxY y: CGFloat) {
        scrollView.contentSize.height = y
    }
    
    
}
