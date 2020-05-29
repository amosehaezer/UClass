//
//  AddDiscussionVC.swift
//  UClass
//
//  Created by Amos Ebenhaezer on 29/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit
import MobileCoreServices

class AddDiscussionVC: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate, UIDocumentPickerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionUIView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var docName: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBOutlet weak var boldButtonOutlet: UIButton!
    @IBOutlet weak var italicButtonOutlet: UIButton!
    @IBOutlet weak var underlineButtonOutlet: UIButton!
    
    
    var boldDetector: Bool = false
    var italicDetector: Bool = false
    var underlineDetector: Bool = false
    
    
    @IBAction func BackButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
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
    @IBAction func pickDocument(_ sender: Any) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeItem as String], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true, completion: nil)
        
        
        
        UIView.animate(withDuration: 2, animations: {self.docName.alpha = 1}) {
            (true) in}
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        guard let selectedFileURL = urls.first else {
            return
        }
        
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let docFileName = dir.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        
        
        if FileManager.default.fileExists(atPath: docFileName.path) {
            print("Already exists! Do nothing")
        }
        else {
            
            do {
                try FileManager.default.copyItem(at: selectedFileURL, to: docFileName)
                print("Copied file!")
                
                
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        

        docName.alpha = 0
        
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
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func initialConfiguration() {
        
        descriptionUIView.layer.borderWidth = 1
        descriptionUIView.layer.cornerRadius = 10
        descriptionUIView.layer.borderColor = UIColor.lightGray.cgColor
        
        doneButton.layer.cornerRadius = 15
    }

}
