//
//  StudentViewCell.swift
//  UClass
//
//  Created by Dorojatun Kuncoro Yekti Raharjo on 26/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

class StudentViewCell: UITableViewCell {
    
    @IBOutlet weak var profilPic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
