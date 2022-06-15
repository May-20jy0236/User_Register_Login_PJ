//
//  Main_ViewController.swift
//  User_Register_Login_PJ
//
//  Created by MAY on 15/6/2022.
//

import UIKit
import CoreData
class Main_ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reenterpassTextField: UITextField!
    var data2 = String()
    var alert = UIAlertController()
    var okAction = UIAlertAction()
    
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
        
        guard let data1 = emailTextField?.text else{ return}
        
        if ( passwordTextField?.text != nil && reenterpassTextField?.text != nil){
            if (passwordTextField?.text == reenterpassTextField?.text ){
                guard let pass = reenterpassTextField?.text else{return}
                data2 = pass
            }else{
                alert = UIAlertController(title: "Error",
                                                message: "Incorrect Password",
                                                preferredStyle: .alert)
                okAction = UIAlertAction(title: "OK",
                                             style: .default)
            }
        }else{
            alert = UIAlertController(title: "Error",
                                            message: "Please Enter User Name and Password",
                                            preferredStyle: .alert)
            okAction = UIAlertAction(title: "OK",
                                         style: .default)
        }
        
        
        alert.addAction(okAction)
        self.save(email: data1, password: data2)
        present(alert, animated: true)

    }
    func save(email: String, password: String) {
      
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      // 1
      let managedContext =
        appDelegate.persistentContainer.viewContext
      
      // 2
      let entity =
        NSEntityDescription.entity(forEntityName: "User",
                                   in: managedContext)!
      
      let person = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
      
      // 3
        person.setValue(email, forKeyPath: "email")
        person.setValue(password, forKeyPath: "password")
      
      // 4
      do {
        try managedContext.save()
        customer.append(person)
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
      }
    }
}
