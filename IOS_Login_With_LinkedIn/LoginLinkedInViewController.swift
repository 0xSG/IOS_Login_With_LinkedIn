//
//  LoginLinkedInViewController.swift
//  IOS_Login_With_LinkedIn
//
//  Created by soorya gangaraj on 9/5/19.
//  Copyright © 2019 atomtray.com. All rights reserved.
//

import UIKit
import WebKit
class LoginLinkedInViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var Webview: WKWebView!
    var loginSuccess = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.linkedin.com/login")
        Webview.load(URLRequest(url: url!))
        
        self.Webview.addObserver(self, forKeyPath: "URL", options: .new, context: nil)

    }
    
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.url) {
            let mainCurrentURL = (self.Webview.url!).absoluteString
            if mainCurrentURL.contains("linkedin.com/feed") {
                print("Login success")
                
                
                
            }
            
        }
    }
    
}
