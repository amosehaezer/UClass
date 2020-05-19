//
//  LatoLabel.swift
//  UClass
//
//  Created by Vincentius Calvin on 19/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

@IBDesignable class LatoLabel: UILabel {
    
    
    @IBInspectable var fontName: String{
        
        set{
            self.font = UIFont(name: newValue, size: 14)
        }
        
        get{
            return fontName
        }
    }
    
    @IBInspectable var latoSize: CGFloat{
           
        set{
            self.font = self.font.withSize(newValue)
        }
    
        get{
               return latoSize
        }
    }

}
