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
    var currentTxt = String()
    var emailTxt = String()
    

    
  
    
    
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
                    
                    self.userNameTxt  = String(describing: username)
                    print(self.userNameTxt)
                }
                
                Webview.evaluateJavaScript("document.getElementsByClassName('member-description')[0].getElementsByClassName('medium-light')[0].innerText") { (currentTxtData, error) -> Void in
                    
                    self.currentTxt  = String(describing: currentTxtData)
                    print(self.currentTxt)
                }

                
                Webview.evaluateJavaScript("document.getElementsByClassName('contact-info email')[0].innerText") { (emaildata, error) -> Void in
                    
                    self.emailTxt  = String(describing: emaildata)
                    print(self.emailTxt)
                }
                
                
                Webview.evaluateJavaScript("document.getElementsByClassName('member-description')[0].getElementsByClassName('medium-light')[1].getElementsByClassName('member-connection-info dot-separator')[0].innerText") { (numConnTxtData, error) -> Void in
                    
                    self.numConnTxt  = String(describing: numConnTxtData)
                    print(self.numConnTxt)
                }
                
                Webview.evaluateJavaScript("document.getElementsByClassName('member-photo-container profile-photo-upload-exp')[0].children[0].getAttribute('src')") { (profileURLTxtData, error) -> Void in
                    
                    self.profileURLTxt  = String(describing: profileURLTxtData)
                    print(self.profileURLTxt)
                }
                
                
                
                
                //open other profile page
                    Webview.setWebViewClient(new WebViewClient() {
                        
                        public void onPageFinished(WebView view, String url) {
                            performSegue(withIdentifier: "profile_segue", sender: self)
                        }
                    });
                //performSegue(withIdentifier: "profile_segue", sender: self)
                
                
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profile_segue"{
            var profileVC = segue.destination as! ProfileViewController
            profileVC.userNameTxt = "Surya"
            profileVC.numConnTxt = "234"

            profileVC.userNameTxt = userNameTxt
            profileVC.profileURLTxt = profileURLTxt
            profileVC.numConnTxt = numConnTxt
            profileVC.currentTxt = currentTxt
            profileVC.emailTxt = emailTxt
        }
    }
    
}
