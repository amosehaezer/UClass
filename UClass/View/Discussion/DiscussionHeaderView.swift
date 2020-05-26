//
//  DiscussionCell.swift
//  MC2
//
//  Created by Vincentius Calvin on 18/05/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

class DiscussionHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var backgroundCamoView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var discussionLabel: UILabel!
    @IBOutlet weak var discussionDateLabel: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var discussionView: UIView!
    @IBOutlet weak var discussionTitleLable: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var pinnedButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var dislikeCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
