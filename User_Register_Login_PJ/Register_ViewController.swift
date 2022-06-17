//
//  Main_ViewController.swift
//  User_Register_Login_PJ
//
//  Created by MAY on 15/6/2022.
//

import UIKit
import CoreData
class Register_ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reenterpassTextField: UITextField!
    var data1 = String()
    var data2 = String()
    var customer: [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "bg.png")
        
        detailView.layer.cornerRadius = 10
        detailView.layer.masksToBounds = true
        
        registerBtn.tintColor = UIColor.black
        registerBtn.layer.cornerRadius = 15
        registerBtn.layer.borderWidth = 2
        registerBtn.layer.borderColor = UIColor(red: 60/255, green: 138/255, blue: 137/255, alpha: 1.0).cgColor
        registerBtn.layer.masksToBounds =  true
     
        
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {

        if (emailTextField.text == "" || passwordTextField.text == "" || reenterpassTextField.text == ""){
            let dialogMsg = UIAlertController(title: "Error", message: "Please Enter User Name and Password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK",
                                         style: .default)
            dialogMsg.addAction(okAction)
            present(dialogMsg, animated: true, completion: nil)
            
        }else if ( passwordTextField.text != reenterpassTextField.text){
            let dialogMessage = UIAlertController(title: "Error", message: "Passwords are not the same", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK",
                                         style: .default)
            dialogMessage.addAction(okAction)
            present(dialogMessage, animated: true, completion: nil)
        }else{
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            let new_user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
            new_user.setValue(emailTextField.text, forKey: "email")
            new_user.setValue(passwordTextField.text, forKey: "password")
            do{
                try context.save()
                print("Registered  Sucessfully")
                
            }
            catch{
                let Fetcherror = error as NSError
                print("error", Fetcherror.localizedDescription)
                
            }
            
        }
        self.performSegue(withIdentifier: "register", sender: nil)

    }

    
    @IBAction func backtoLogin_Button(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
//    func save(email: String, password: String) {
//
//      guard let appDelegate =
//        UIApplication.shared.delegate as? AppDelegate else {
//        return
//      }
//
//      // 1
//      let managedContext =
//        appDelegate.persistentContainer.viewContext
//
//      // 2
//      let entity =
//        NSEntityDescription.entity(forEntityName: "User",
//                                   in: managedContext)!
//
//      let person = NSManagedObject(entity: entity,
//                                   insertInto: managedContext)
//
//      // 3
//        person.setValue(email, forKeyPath: "email")
//        person.setValue(password, forKeyPath: "password")
//
//      // 4
//      do {
//        try managedContext.save()
//        customer.append(person)
//      } catch let error as NSError {
//        print("Could not save. \(error), \(error.userInfo)")
//      }
//    }
}

