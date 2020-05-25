//
//  ViewController.swift
//  OTPPage
//
//  Created by Josia Mannuel on 24/05/20.
//  Copyright © 2020 Josia Mannuel. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet weak var warninglabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    
    var otpToken: String?
    
    var emailArr = ["joy.mannuell@gmail.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        
        self.hideKeyboardWhenTappedAround()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            warninglabel.text = "Please enter an email."
            warninglabel.isHidden = false
        }
        else if emailArr.contains(textField.text!) == false{
            warninglabel.text = "Email is not registered."
            warninglabel.isHidden = false
        }
        else{
            warninglabel.isHidden = true
            sendButton.backgroundColor = #colorLiteral(red: 0.0740384087, green: 0.1692422628, blue: 0.394243896, alpha: 1)
            sendButton.isEnabled = true
        }
    }
    
    var fourDigitNumber: String {
     var result = ""
     repeat {
         result = String(format:"%04d", arc4random_uniform(10000) )
     } while Set<Character>(result).count < 4
     return result
    }
    
    @IBAction func sendCode(_ sender: Any) {
        otpToken = fourDigitNumber
        print(otpToken!)
        performSegue(withIdentifier: "toOTP", sender: (Any).self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let otpVC = segue.destination as! OTPViewController
        otpVC.otpToken = self.otpToken
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
    }
    
    

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

