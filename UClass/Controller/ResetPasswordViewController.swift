//
//  ResetPasswordViewController.swift
//  OTPPage
//
//  Created by Josia Mannuel on 24/05/20.
//  Copyright © 2020 Josia Mannuel. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var enterNew: UITextField!
    @IBOutlet weak var confirmNew: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        showPassIcon(passtextField: enterNew)
        showPassIcon(passtextField: confirmNew)
        
    }
    
    func showPassIcon (passtextField: UITextField){
        let showPass = UIButton(type: .custom)
        showPass.setImage(UIImage(systemName: "eye.fill"),for: .normal)
        showPass.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        showPass.frame = CGRect(x: CGFloat(passtextField.frame.size.width - 25), y: 5, width: 20, height: 20)
        passtextField.rightView = showPass
        passtextField.rightViewMode = .always
        
        if passtextField == enterNew{
            showPass.tag = 0
        }
        else if passtextField == confirmNew{
            showPass.tag = 1
        }
        showPass.addTarget(self, action: #selector(showPassTxt), for: .touchUpInside)
    }
    
    var hidePassTxt = true
    
    @objc func showPassTxt(_ sender: UIButton) {
        let id = (sender as AnyObject).tag
        if id == 0{
            if(hidePassTxt == true) {
                enterNew.isSecureTextEntry = false
                sender.setImage(UIImage(systemName:"eye.slash.fill"), for: .normal)
            } else {
                enterNew.isSecureTextEntry = true
                sender.setImage(UIImage(systemName:"eye.fill"), for: .normal)
            }
        }
        else{
            if(hidePassTxt == true) {
                confirmNew.isSecureTextEntry = false
                sender.setImage(UIImage(systemName:"eye.slash.fill"), for: .normal)
            } else {
                confirmNew.isSecureTextEntry = true
                sender.setImage(UIImage(systemName:"eye.fill"), for: .normal)
            }

        }
        
        hidePassTxt = !hidePassTxt
    }

   
}
