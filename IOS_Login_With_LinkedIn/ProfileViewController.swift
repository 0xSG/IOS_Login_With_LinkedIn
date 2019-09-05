//
//  ProfileViewController.swift
//  IOS_Login_With_LinkedIn
//
//  Created by soorya gangaraj on 9/5/19.
//  Copyright © 2019 atomtray.com. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    var userNameTxt = String()
    var profileURLTxt = String()
    var numConnTxt = String()
    var currentTxt = String()
    var emailTxt = String()
    
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var noConnections: UILabel!
    @IBOutlet weak var curLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    
    func formateString(str: String) -> String {
        
        if emailTxt.endIndex.encodedOffset > 9{
        let start = str.index(str.startIndex, offsetBy: 9)
        let end = str.index(str.endIndex, offsetBy: -1)
        let range = start..<end
        let res = str[range]
            return String(res)
        }
        else{
            return ""
        }
        
    }
    func formateEmail(str: String) -> String {
        
        
        if emailTxt.endIndex.encodedOffset > 6{
        let start = str.index(str.startIndex, offsetBy: 6)
        let end = str.index(str.endIndex, offsetBy: -1)
        let range = start..<end
        let res = str[range]
            return String(res)
        }else{
            return ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //circular pic
        profile_image.layer.cornerRadius = profile_image.frame.width/2
        profile_image.clipsToBounds = true
        profile_image.layer.borderColor = UIColor.white.cgColor
        profile_image.layer.borderWidth = 5
        
        //assigining data
        
        
        user_name.text = formateString(str: userNameTxt)
        
        noConnections.text = formateString(str: numConnTxt)
        curLabel.text = formateString(str: currentTxt)
        
        
        
            
        
        
        
        emailTxt = formateString(str: emailTxt)
        
        emailLabel.text = formateEmail(str: emailTxt)
        
        
        profile_image.downloaded(from: formateString(str: profileURLTxt))

        
   

    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    

    
}

