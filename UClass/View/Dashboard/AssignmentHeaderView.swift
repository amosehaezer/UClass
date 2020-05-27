//
//  AssignmentHeaderView.swift
//  MC2
//
//  Created by Vincentius Calvin on 27/05/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

class AssignmentHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var assignmentTitleLabel: UILabel!
    @IBOutlet weak var assignmentContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
