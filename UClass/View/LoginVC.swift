//
//  LoginViewController.swift
//  UClass
//
//  Created by Amos Ebenhaezer on 25/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {

    let loginManager = Services.shared
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        
        Auth.auth().createUser(withEmail: "student@mail.com", password: "student") { (result, error) in
            if let e = error {
                print(e.localizedDescription)
                return
            }

            guard let uid = result?.user.uid else {return}

            let role = 0

            var data: [String:Any]

            if role == 1 {
                data = [
                    "name" : "user",
                    "email" : "user@user.com",
                    "uid" : uid,
                    "role" : role,
                    "courses" : [String]()
                ]
            } else {
                data = [
                    "name" : "user",
                    "email" : "user@user.com",
                    "uid" : uid,
                    "role" : role,
                ]
            }

            Services.shared.addUser(userData: data) {
                print("DEBUG : Success add new user!")
            }
        }
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
//        if emailTextfield.text == "" || passwordTextfield.text == "" {
//            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
//            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            alertController.addAction(defaultAction)
//            self.present(alertController, animated: true, completion: nil)
//        } else {
//            var log = loginManager.login(email: emailTextfield.text!, pass: passwordTextfield.text!)
//            print(log)
//            if log == 200 {
//                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let homeViewController = storyBoard.instantiateViewController(withIdentifier: "dashboard") as! HomeVC
//                self.present(homeViewController, animated: true, completion: nil)
//
//            } else {
//                let alertController = UIAlertController(title: "Error", message: "Wrong email or password.", preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                alertController.addAction(defaultAction)
//                self.present(alertController, animated: true, completion: nil)
//            }
//        }
//    }
        
        if self.emailTextfield.text == "" || self.passwordTextfield.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
                if error == nil {
                    print("You have successfully logged in")
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "dashboard") as! HomeVC
                            self.present(newViewController, animated: true, completion: nil)
//                    let alertController = UIAlertController(title: "Success", message: error?.localizedDescription, preferredStyle: .alert)
//                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    alertController.addAction(defaultAction)
//                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func signUpBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "signup") as! SignUpVC
                self.present(newViewController, animated: true, completion: nil)
    }
}
