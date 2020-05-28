//
//  TeacherAddTopicViewController.swift
//  UClass
//
//  Created by laurens bryan on 19/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

class TeacherAddTopicVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionUIView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBOutlet weak var boldButtonOutlet: UIButton!
    @IBOutlet weak var italicButtonOutlet: UIButton!
    @IBOutlet weak var underlineButtonOutlet: UIButton!
    
    
    var boldDetector: Bool = false
    var italicDetector: Bool = false
    var underlineDetector: Bool = false
    
    
    
    @IBAction func boldButton(_ sender: Any) {
        if boldDetector == true {
            boldButtonOutlet.layer.backgroundColor = UIColor.clear.cgColor
            boldDetector = false
        } else {
            boldButtonOutlet.layer.backgroundColor = UIColor.lightGray.cgColor
            boldDetector = true
        }
    }
    @IBAction func italicButton(_ sender: Any) {
        if italicDetector == true {
            italicButtonOutlet.layer.backgroundColor = UIColor.clear.cgColor
            italicDetector = false
        } else {
            italicButtonOutlet.layer.backgroundColor = UIColor.lightGray.cgColor
            italicDetector = true
        }
    }
    @IBAction func underlineButton(_ sender: Any) {
        if underlineDetector == true {
            underlineButtonOutlet.layer.backgroundColor = UIColor.clear.cgColor
            underlineDetector = false
        } else {
            underlineButtonOutlet.layer.backgroundColor = UIColor.lightGray.cgColor
            underlineDetector = true
        }
    }
    
    
    @IBAction func cameraButton(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image,animated: true){
            //image loaded
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        initialConfiguration()
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            //ImageOutlet.image = image
        } else {
            print("ERROR")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func initialConfiguration() {
        
        descriptionUIView.layer.borderWidth = 1
        descriptionUIView.layer.cornerRadius = 10
        descriptionUIView.layer.borderColor = UIColor.lightGray.cgColor
        
        doneButton.layer.cornerRadius = 15
    }
}
