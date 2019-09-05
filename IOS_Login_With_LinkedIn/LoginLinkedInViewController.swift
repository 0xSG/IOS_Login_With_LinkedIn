//
//  LoginLinkedInViewController.swift
//  IOS_Login_With_LinkedIn
//
//  Created by soorya gangaraj on 9/5/19.
//  Copyright © 2019 atomtray.com. All rights reserved.
//

import UIKit
import Foundation;
import WebKit
class LoginLinkedInViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var Webview: WKWebView!
    
    var userNameTxt = String()
    var profileURLTxt = String()
    var numConnTxt = String()
    var eduText = String()
    

    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.linkedin.com/mwlite/me")
        Webview.load(URLRequest(url: url!))
        
        self.Webview.addObserver(self, forKeyPath: "URL", options: .new, context: nil)

    }
    
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.url) {
            let mainCurrentURL = (self.Webview.url!).absoluteString
            if mainCurrentURL.contains("linkedin.com/mwlite") {
                print("Login success")
                
                //fetch all data
                
                
                Webview.evaluateJavaScript("document.getElementsByClassName('member-name extra-extra-large-semibold profile-photo-upload-exp')[0].innerText") { (username, error) -> Void in
                    
                    self.userNameTxt = username as! String
                }
                Webview.evaluateJavaScript("document.getElementsByClassName('member-description')[0].innerText") { (data, error) -> Void in
                    
                    
                    var newData = (data as! String).replacingOccurrences(of: self.userNameTxt, with: "", options: NSString.CompareOptions.literal, range: nil)
                    print(newData)
                    
                    
                }
                
                
                //open other profile page
                performSegue(withIdentifier: "profile_segue", sender: self)
                
                
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profile_segue"{
            var profileVC = segue.destination as! ProfileViewController
            profileVC.userNameTxt = "Surya"
            profileVC.numConnTxt = "234"

        }
    }
    
}
