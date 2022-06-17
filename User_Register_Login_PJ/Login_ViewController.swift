//
//  Login_ViewController.swift
//  User_Register_Login_PJ
//
//  Created by MAY on 16/6/2022.
//

import UIKit
import CoreData

class Login_ViewController: UIViewController {

    @IBOutlet weak var backgroundImgView: UIImageView!
    
    @IBOutlet weak var login_bgView: UIView!
    @IBOutlet weak var login_emailTextField: UITextField!
    @IBOutlet weak var login_passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var result = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImgView.image = UIImage(named: "bg.png")
        
        login_bgView.layer.cornerRadius = 10
        login_bgView.layer.masksToBounds = true
        loginBtn.tintColor = UIColor.black
        loginBtn.layer.cornerRadius = 15
        loginBtn.layer.borderWidth = 2
        loginBtn.layer.borderColor = UIColor(red: 60/255, green: 138/255, blue: 137/255, alpha: 1.0).cgColor
        loginBtn.layer.masksToBounds =  true
    }

    @IBAction func loginBtn(_ sender: UIButton) {
        if (login_emailTextField.text == "" && login_passwordTextField.text == "") {
            let alert = UIAlertController(title: "Error", message: "Please input username and password", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        else{
            self.CheckEmailandPasswordarematching(email : login_emailTextField.text! as String, password: login_passwordTextField.text! as String)
        }
    }
    func CheckEmailandPasswordarematching( email: String, password : String)
    {
        let app = UIApplication.shared.delegate as! AppDelegate

        let context = app.persistentContainer.viewContext

        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")

        let predicate = NSPredicate(format: "email = %@", email)

        fetchrequest.predicate = predicate
        do
        {
            result = try context.fetch(fetchrequest) as NSArray

            if result.count>0
            {
                let objectentity = result.firstObject as! User

                if objectentity.email == email && objectentity.password == password
                {
                    print("Login Succesfully")
                }
                else
                {
                    print("Wrong username or password !!!")
                }
            }
        }

        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
    }
    
    @IBAction func sign_upBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier:"toregister", sender: nil)
    }
}
