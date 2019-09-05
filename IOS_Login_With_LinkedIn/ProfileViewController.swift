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
    var eduText = String()

    
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var noConnections: UILabel!
    @IBOutlet weak var eduLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //circular pic
        profile_image.layer.cornerRadius = profile_image.frame.width/2
        profile_image.clipsToBounds = true
        profile_image.layer.borderColor = UIColor.white.cgColor
        profile_image.layer.borderWidth = 5
        
        //assigining data
        user_name.text = userNameTxt
        noConnections.text = numConnTxt
        eduLabel.text = eduText
        
        
        
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
