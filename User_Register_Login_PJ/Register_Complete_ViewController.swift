//
//  Register_Complete_ViewController.swift
//  User_Register_Login_PJ
//
//  Created by MAY on 16/6/2022.
//

import UIKit
import CoreData

class Register_Complete_ViewController: UIViewController {

   
    @IBOutlet weak var gobacktoLogin_Btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        gobacktoLogin_Btn.layer.cornerRadius = 0.5 * gobacktoLogin_Btn.bounds.size.width
        gobacktoLogin_Btn.clipsToBounds = true
       
    }
    
    @IBAction func gobacktoLogin_Btn(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}

