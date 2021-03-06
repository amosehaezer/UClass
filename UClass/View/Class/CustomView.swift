//
//  CustomView.swift
//  UClass
//
//  Created by Dorojatun Kuncoro Yekti Raharjo on 21/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

class CustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
     
    */
    @IBInspectable var cornerRadius: CGFloat {

     get{
          return layer.cornerRadius
      }
      set {
          layer.cornerRadius = newValue
          layer.masksToBounds = newValue > 0
      }
    }

    @IBInspectable var borderWidth: CGFloat {
      get {
          return layer.borderWidth
      }
      set {
          layer.borderWidth = newValue
      }
    }

    @IBInspectable var borderColor: UIColor? {
      get {
          return UIColor(cgColor: layer.borderColor!)
      }
      set {
          layer.borderColor = borderColor?.cgColor
      }
    }

}
