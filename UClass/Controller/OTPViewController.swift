//
//  OTPViewController.swift
//  OTPPage
//
//  Created by Josia Mannuel on 25/05/20.
//  Copyright © 2020 Josia Mannuel. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtOTP1: UITextField!
    @IBOutlet weak var txtOTP2: UITextField!
    @IBOutlet weak var txtOTP3: UITextField!
    @IBOutlet weak var txtOTP4: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var resendButton: UIButton!
    
    @IBOutlet weak var OTPwarning: UILabel!
    
    var otpToken: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBottomBorderTo(textField: txtOTP1)
        addBottomBorderTo(textField: txtOTP2)
        addBottomBorderTo(textField: txtOTP3)
        addBottomBorderTo(textField: txtOTP4)
        
        txtOTP1.delegate = self
        txtOTP2.delegate = self
        txtOTP3.delegate = self
        txtOTP4.delegate = self
        
        txtOTP1.becomeFirstResponder()
        
    }
    
    func addBottomBorderTo(textField:UITextField) {
        let layer = CALayer()
        layer.backgroundColor = #colorLiteral(red: 0.0740384087, green: 0.1692422628, blue: 0.394243896, alpha: 1)
        layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
        textField.layer.addSublayer(layer)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            if textField == txtOTP1 {
                txtOTP2.becomeFirstResponder()
            }
            
            if textField == txtOTP2 {
                txtOTP3.becomeFirstResponder()
            }
            
            if textField == txtOTP3 {
                txtOTP4.becomeFirstResponder()
            }
            
            if textField == txtOTP4 {
                txtOTP4.resignFirstResponder()
            }
            
            textField.text = string
            return false
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == txtOTP2 {
                txtOTP1.becomeFirstResponder()
            }
            if textField == txtOTP3 {
                txtOTP2.becomeFirstResponder()
            }
            if textField == txtOTP4 {
                txtOTP3.becomeFirstResponder()
            }
            if textField == txtOTP1 {
                txtOTP1.resignFirstResponder()
            }
            
            textField.text = ""
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        
        return true
    }
    
    var fourDigitNumber: String {
     var result = ""
     repeat {
         result = String(format:"%04d", arc4random_uniform(10000) )
     } while Set<Character>(result).count < 4
     return result
    }
    
    var OTPinput:String?
    
    @IBAction func verifyOTP(_ sender: Any) {
        OTPinput = "\(txtOTP1.text!)\(txtOTP2.text!)\(txtOTP3.text!)\(txtOTP4.text!)"
        if OTPinput! != otpToken!{
            OTPwarning.text = "OTP does not match"
            OTPwarning.isHidden = false
            txtOTP1.text = ""
            txtOTP2.text = ""
            txtOTP3.text = ""
            txtOTP4.text = ""
        }
        else if OTPinput! == ""{
            OTPwarning.text = "Please enter your OTP"
            OTPwarning.isHidden = false
        }
        else{
             OTPwarning.isHidden = true
            performSegue(withIdentifier: "showReset", sender: self)
        }
    }
    
    @IBAction func resendOTP(_ sender: Any) {
        otpToken = fourDigitNumber
        print(otpToken!)
    }
    
    

}

