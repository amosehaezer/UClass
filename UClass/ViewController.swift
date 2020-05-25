//
//  ViewController.swift
//  UClass
//
//  Created by Amos Ebenhaezer on 12/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        emailTextfield.tintColor = UIColor.lightGray
        emailTextfield.setIcon(#imageLiteral(resourceName: "􀍕"))
        passwordTextfield.tintColor = UIColor.lightGray
        passwordTextfield.setIcon(#imageLiteral(resourceName: "􀎠"))
    }


}

extension UITextField {
    func setIcon(_ icon:UIImage) {
   let iconView = UIImageView(frame: CGRect(x: 10, y: 4, width: 20, height: 20))
        
        iconView.image = icon
        iconView.contentMode = .scaleAspectFit
        
   let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 35, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
}

