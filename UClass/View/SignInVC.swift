//
//  SignInViewController.swift
//  UClass
//
//  Created by Dorojatun Kuncoro Yekti Raharjo on 20/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

class SignInVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 

    

    @IBOutlet weak var RoleField: UITextField!
    
    let role = ["Teacher","Student"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        pickerView.delegate = self
        pickerView.dataSource = self

        RoleField.inputView = pickerView
        RoleField.textAlignment = .left
        
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
