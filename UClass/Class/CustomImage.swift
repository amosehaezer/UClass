//
//  CustomImage.swift
//  UClass
//
//  Created by Dorojatun Kuncoro Yekti Raharjo on 21/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

class CustomImage: UIImageView {

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
