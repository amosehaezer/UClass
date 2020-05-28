//
//  InsideTopicVC.swift
//  MC2
//
//  Created by Vincentius Calvin on 27/05/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

struct ClassAssignment{
    
    var assignmentTitle : String
    var assignmentContent : String
    var teacherName : String
    var datePosted : String
    //var attachmemt: URL??
    var profileImage : String
}

class InsideTopicVC: UIViewController {
    
    var testAssignment = ClassAssignment(assignmentTitle: "Integration by Parts", assignmentContent: "In calculus, and more generally in mathematical analysis, integration by parts or partial integration is a process that finds the integral of a product of functions in terms of the integral of the product of their derivative and antiderivative. It is frequently used to transform the antiderivative of a product of functions into an antiderivative for which a solution can be more easily found. The rule can be thought of as an integral version of the product rule of differentiation. The assignments are attached below. Please submit your work before Wednesday by email.", teacherName: "Selena Strange", datePosted: "Saturday, May 2 at 08:00am", profileImage: "profile-3")

    var testList = [

        Discussions(isExpanded : false, replies: [Replies(name: "Anita Miles", profile: UIImage(named: "profile-1")!, datePost: "Sunday, 3 May 2020 09:50pm", like: 12, dislike: 0, isLiked: false, isDisliked: false, replyContent: "I noticed that u and v are two crucial components which needed to be determined first before integration by parts can be done. However, I have difficulty in these cases."), Replies(name: "Roberto Gonzales", profile: UIImage(named: "profile-2")!, datePost: "Sunday, 3 May 2020 11:00pm", like: 5, dislike: 2, isLiked: false, isDisliked: false, replyContent: "I noticed that u and v are two crucial components which needed to be determined first before integration by parts can be done. However, I have difficulty in these cases.")],profile: UIImage(named: "profile-1")!,name: "Rebecca", datePost: "Sunday, 3 May 2020 05:50pm",isPinned: true,like: 30,dislike: 0,isLiked: false,isDisliked: false, discussionTitle: "Confused in determining u and v",discussionContent: "I noticed that u and v are two crucial components which needed to be determined first before integration by parts can be done. However, I have difficulty in these cases. Please help!!!"),
        Discussions(isExpanded : false, replies: [Replies(name: "Dorothy Perkins", profile: UIImage(named: "profile-3")!, datePost: "Monday, 4 May 2020 09:50pm", like: 0, dislike: 0, isLiked: false, isDisliked: false, replyContent: "I noticed that u and v are two crucial components which needed to be determined first before integration by parts can be done. However, I have difficulty in these cases."), Replies(name: "Cynthia Gabrielle", profile: UIImage(named: "profile-3")!, datePost: "Monday, 4 May 2020 11:00pm", like: 3, dislike: 2, isLiked: false, isDisliked: false, replyContent: "Nice insight"), Replies(name: "Tony Stark", profile: UIImage(named: "profile-5")!, datePost: "Wednesday, 6 May 2020 00:12am", like: 0, dislike: 0, isLiked: false, isDisliked: false, replyContent: "These are indeed amazing!")],profile: UIImage(named: "profile-5")!,name: "Anita Miles", datePost: "Sunday, 3 May 2020 03:50pm",isPinned: true,like: 25,dislike: 0,isLiked: false,isDisliked: false, discussionTitle: "Repeated Patterns", discussionContent: "I don’t know whether my computations are wrong or not. But, I have rechecked several times and I am confident that I am right. I notice that there are these specific patterns in integral!"),
    Discussions(isExpanded : false, replies: [],profile: UIImage(named: "profile-2")!,name: "Tony Stark", datePost: "Friday, 6 May 2020 03:33am",isPinned: true,like: 11,dislike: 3,isLiked: false,isDisliked: false, discussionTitle: "Bounded Integral", discussionContent: "What if the integral problems have bounds? Can integration by parts method still be applied?")
    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        
        self.navigationController?.navigationBar.isHidden = false
    
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 600
        
        tableView.register(UINib(nibName: "AssignmentHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "assignmentHeader")
        tableView.register(UINib(nibName: "InsideTopicSeeAll", bundle: nil), forHeaderFooterViewReuseIdentifier: "seeAll")
        tableView.register(UINib(nibName: "DiscussionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "discussionHV")
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension InsideTopicVC: UITableViewDataSource{
    
    @objc func liked(button : UIButton){
        
        let section = button.tag
        
        if !testList[section].isLiked{
            button.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            testList[section].like += 1
            testList[section].isLiked = true
            if testList[section].isDisliked{
                //                button.tintColor = .systemBlue
                testList[section].isDisliked = false
                testList[section].dislike -= 1
                
            }
        }else{
            button.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            testList[section].like -= 1
            testList[section].isLiked = false
        }
        tableView.reloadData()
        
        
    }
    
    @objc func disliked(button : UIButton){
        let section = button.tag
        
        if !testList[section].isDisliked{
            button.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
            testList[section].dislike += 1
            testList[section].isDisliked = true
            if testList[section].isLiked{
                //                button.tintColor = .systemBlue
                testList[section].isLiked = false
                testList[section].like -= 1
                
            }
        }else{
            button.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
            testList[section].dislike -= 1
            testList[section].isDisliked = false
        }
        tableView.reloadData()
        
        
    }
        

    
    @objc func seeall(button: UIButton){
        
        performSegue(withIdentifier: "seeDiscussion", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
}

extension InsideTopicVC: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5

    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        switch section {
        case 0:
            if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "assignmentHeader") as? AssignmentHeaderView{
                view.assignmentContent.text = testAssignment.assignmentContent
                view.assignmentTitleLabel.text = testAssignment.assignmentTitle
                view.dateLabel.text = testAssignment.datePosted
                view.profileImage.image = UIImage(named: testAssignment.profileImage)
                view.profileName.text = testAssignment.teacherName
                view.profileImage.layer.cornerRadius = view.profileImage.frame.height/2
                return view
            } else {
                return AssignmentHeaderView()
            }
        case 1:
            if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "seeAll") as? InsideTopicSeeAll{
                
                view.seeAllButton.addTarget(self, action: #selector(seeall), for: .touchUpInside)
                
                return view
            } else {
                return InsideTopicSeeAll()
            }
        default:
            if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "discussionHV") as? DiscussionHeaderView{
                //view.layer.cornerRadius = 20
                view.discussionView.layer.cornerRadius = 20
                view.backgroundCamoView.isHidden = true
                view.profileName.text = testList[section-2].name
                view.discussionDateLabel.text = testList[section-2].datePost
                view.profileImage.image = testList[section-2].profile
                view.discussionLabel.text = testList[section-2].discussionContent
                view.discussionTitleLable.text = testList[section-2].discussionTitle
                view.likeCountLabel.text = "\(testList[section-2].like)"
                view.dislikeCountLabel.text = "\(testList[section-2].dislike)"
                view.profileImage.layer.cornerRadius = view.profileImage.frame.height/2
                
                view.likeButton.tag = section-2
                view.dislikeButton.tag = section-2
                view.likeButton.addTarget(self, action: #selector(liked), for: .touchUpInside)
                view.dislikeButton.addTarget(self, action: #selector(disliked), for: .touchUpInside)
                if testList[section-2].isLiked {
                    view.likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
                    view.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
                } else if testList[section-2].isDisliked{
                    view.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
                    view.likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
                }
                view.replyButton.setTitle("Replies (\(testList[section-2].replies.count)) 􀆈", for: .normal)
                
                return view
            } else {
                return DiscussionHeaderView()
            }
        }
        //
    }
    
    
}
