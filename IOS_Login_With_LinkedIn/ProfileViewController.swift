//
//  ProfileViewController.swift
//  IOS_Login_With_LinkedIn
//
//  Created by soorya gangaraj on 9/5/19.
//  Copyright © 2019 atomtray.com. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profile_image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        profile_image.layer.cornerRadius = profile_image.frame.width/2
        profile_image.clipsToBounds = true
        profile_image.layer.borderColor = UIColor.white.cgColor
        profile_image.layer.borderWidth = 5
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
