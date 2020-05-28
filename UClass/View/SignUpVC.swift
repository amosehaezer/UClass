//
//  SignInViewController.swift
//  UClass
//
//  Created by Dorojatun Kuncoro Yekti Raharjo on 20/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    @IBOutlet weak var FullnameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var ConfirmpassField: UITextField!
    @IBOutlet weak var RoleField: UITextField!
    @IBOutlet weak var notifLabel: UILabel!
    
    let role = ["Teacher","Student"]
    var saveRole: Int = 0
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self

        RoleField.inputView = pickerView
        RoleField.textAlignment = .left
      }
    
    @IBAction func SignupButton(_ sender: UIButton) {
        self.createUser()
        
    }
    @IBAction func LoginButton(_ sender: UIButton) {
//        performSegue(withIdentifier: "toLogin", sender: self)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginVC
                self.present(newViewController, animated: true, completion: nil)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return role.count
        }
  
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return role[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        RoleField.text = role[row]
        RoleField.resignFirstResponder()
    }
    
    func rolePick(){
        if role == ["Student"]{
        RoleField.text = "0"
            saveRole = 0
        }else{
        RoleField.text = "1"
            saveRole = 1
        }
    }
    
    func createUser(){
        Auth.auth().createUser(withEmail: EmailField.text!, password: PasswordField.text!) { (result, error) in
            if let e = error {
                self.notifLabel.text = e.localizedDescription
                print(e.localizedDescription)
                return
            }

            guard let uid = result?.user.uid else {return}

            var role = self.saveRole

            var data: [String:Any]

            if role == 1 {
                data = [
                    "name" : self.FullnameField.text!,
                    "email" : self.EmailField.text!,
                    "uid" : uid,
                    "role" : role,
                    "students" : [String]()
                ]
            } else {
                data = [
                    "name" : self.FullnameField.text!,
                    "email" : self.EmailField.text!,
                    "uid" : uid,
                    "role" : role,
                ]
            }

            Services.shared.addUser(userData: data) {
//                print("DEBUG : Success add new user!")
                self.notifLabel.text! = "Success add new user!"
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "dashboard") as! HomeVC
                self.present(newViewController, animated: true, completion: nil)
                
            }
        }
        
        
//        if let email = EmailField.text, let password = PasswordField.text, let role = RoleField.text{
//        Auth.auth().signIn(withEmail: email, password: password) { user, error in
//            if let Error = error{
//
//                let errorAlert = UIAlertController(title: "Error", message: Error.localizedDescription, preferredStyle: .alert)
//                let errorAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                errorAlert.addAction(errorAction)
//                self.present(errorAlert, animated: true, completion:  nil)
//            }else{
//                let confirmpass = self.ConfirmpassField.text
//                if password == confirmpass {
//                    self.signupUser()
//                }
//                else{
//                 let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                alertController.addAction(defaultAction)
//                self.present(alertController, animated: true, completion: nil)
//                    }
//                }
//            }
//        }
    }
    
    func signupUser(){
        print("You have successfully logged in")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "dashboard") as! HomeVC
       self.present(newViewController, animated: true, completion: nil)
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
