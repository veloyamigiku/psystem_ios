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
        
        deployComponent()
        
    }
    
    func deployComponent() {
        
        // スクロールビューを作成する。
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        // ログインビューを作成する。
        loginView = LoginView()
        loginView.delegate = self
        scrollView.addSubview(loginView)
        
    }
    
    override func viewDidLayoutSubviews() {
        
        scrollView.frame = self.view.frame
        scrollView.contentSize = self.view.frame.size
        
        loginView.frame = self.view.frame
        
    }
    
}

extension ViewController: LoginViewDelegate {
    
    func loginView(loginButtonDidTap view: LoginView) {
        print("LoginViewDelegate.loginButtonDidTap")
    }
    
    func loginView(signupButtonDidTap view: LoginView) {
        print("LoginViewDelegate.signupButtonDidTap")
    }
    
    
}
