//
//  AddClassVC.swift
//  UClass
//
//  Created by Josia Mannuel on 27/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

protocol AddClassData {
    func sendClassData(className: String, classSubject: String, studentsEmail: [String])
}

class AddClassVC: UIViewController {
    
    var instaceHVC : HomeVC!
    
    

    @IBOutlet weak var emailTextView: UITextView!
    @IBOutlet weak var studentEmails: UITextView!
    @IBOutlet weak var classSubjectTextfield: UITextField!
    @IBOutlet weak var classNameTextfield: UITextField!
    
    var delegate: AddClassData!
    
    var className: String? = ""
    var classSubject: String? = ""
    var studentsEmail: [String]? = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.navigationBar.isHidden = true
        emailTextView.layer.borderWidth = 1
        emailTextView.layer.borderColor = UIColor.lightGray.cgColor
        emailTextView.layer.cornerRadius = 10
        self.hideKeyboardWhenTappedAround()
    }
    
    
    
    @IBAction func createButton(_ sender: Any) {
        className = classNameTextfield.text
        classSubject = classSubjectTextfield.text
        studentsEmail = studentEmails.text.components(separatedBy: ", ")
        
        delegate?.sendClassData(className: className!, classSubject: classSubject!, studentsEmail: studentsEmail!)
        
        instaceHVC.tableView.reloadData()
        
        self.dismiss(animated: true, completion: nil)
        
//        Services.
        
    }
    @IBAction func cancelBtn(_ sender: Any) {
        //performSegue(withIdentifier: "toHome", sender: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
//    func addTopic() {
//        var data: [String: Any]
//        
//        data = [
//            "topicTitle": titleTextField.text!,
//            "topicDescription": descriptionTextView.text!
//        ]
//        
//        Services.shared.addDiscussion(discussionData: data) {
//            print("DEBUG: Success create a topic!")
//        }
//    }
    
    
    

}
