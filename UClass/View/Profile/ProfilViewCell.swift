//
//  ProfilViewCell.swift
//  UClass
//
//  Created by Dorojatun Kuncoro Yekti Raharjo on 29/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

class ProfilViewCell: UITableViewCell {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var profilData: UILabel!
    @IBOutlet weak var separator: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    
}
