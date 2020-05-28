//
//  DiscussionVC.swift
//  MC2
//
//  Created by Vincentius Calvin on 18/05/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

struct Discussions {
    var isExpanded : Bool
    var replies : [Replies]
    var profile : UIImage
    var name : String
    var datePost : String
    var isPinned : Bool
    var like : Int
    var dislike : Int
    var isLiked : Bool
    var isDisliked : Bool
    var discussionTitle : String
    var discussionContent : String
    // var attachment : ??
}

struct Replies {
    var name : String
    var profile : UIImage
    var datePost : String
    var like : Int
    var dislike : Int
    var isLiked : Bool
    var isDisliked : Bool
    var replyContent : String
}

class DiscussionVC: UIViewController {
    
    var testList = [

        Discussions(isExpanded : false, replies: [Replies(name: "Anita Miles", profile: UIImage(named: "profile-1")!, datePost: "Sunday, 3 May 2020 09:50pm", like: 12, dislike: 0, isLiked: false, isDisliked: false, replyContent: "This is a mandatory reply i dont really care bro, this is so f-in hard. But we can do these mannn leggoo."), Replies(name: "Roberto Gonzales", profile: UIImage(named: "profile-2")!, datePost: "Sunday, 3 May 2020 11:00pm", like: 5, dislike: 2, isLiked: false, isDisliked: false, replyContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")],profile: UIImage(named: "profile-1")!,name: "Rebecca", datePost: "Sunday, 3 May 2020 05:50pm",isPinned: true,like: 30,dislike: 0,isLiked: false,isDisliked: false, discussionTitle: "Solving Partial Integral",discussionContent: "How do i solve these following questions aaaaaaaaaaaaaaaaaaaaaaasaaffafgafasasaghaadahdjahfafjasjasjajgkaj"),
        Discussions(isExpanded : false, replies: [Replies(name: "Dorothy Perkins", profile: UIImage(named: "profile-3")!, datePost: "Monday, 4 May 2020 09:50pm", like: 0, dislike: 0, isLiked: false, isDisliked: false, replyContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"), Replies(name: "Cynthia Gabrielle", profile: UIImage(named: "profile-3")!, datePost: "Monday, 4 May 2020 11:00pm", like: 3, dislike: 2, isLiked: false, isDisliked: false, replyContent: "Lu dodol"), Replies(name: "Tony Stark", profile: UIImage(named: "profile-5")!, datePost: "Wednesday, 6 May 2020 00:12am", like: 0, dislike: 0, isLiked: false, isDisliked: false, replyContent: "Gua juga ga ngerti brooooo wkwkkwwkw ngakak emang lu")],profile: UIImage(named: "profile-5")!,name: "Anita Miles", datePost: "Sunday, 3 May 2020 03:50pm",isPinned: true,like: 25,dislike: 0,isLiked: false,isDisliked: false, discussionTitle: "Soalnya Susah Bu", discussionContent: "Bu saya itu sungguh-sungguh tidak mengerti tolonglah Bu. Saya aja dari minggu lalu ga paham-paham loh. Kok ini tugasnya belibet abis sichhhh"),
    Discussions(isExpanded : false, replies: [],profile: UIImage(named: "profile-2")!,name: "Tony Stark", datePost: "Friday, 6 May 2020 03:33am",isPinned: true,like: 11,dislike: 3,isLiked: false,isDisliked: false, discussionTitle: "Salah Soal", discussionContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
    ]

    @IBOutlet weak var discussionsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.discussionsTableView.dataSource = self
        self.discussionsTableView.delegate = self
        setupTableView()
        discussionsTableView.rowHeight = UITableView.automaticDimension
        discussionsTableView.estimatedRowHeight = 600
        //discussionsTableView.layer.cornerRadius = 20
        discussionsTableView.sectionHeaderHeight = UITableView.automaticDimension
        discussionsTableView.estimatedSectionHeaderHeight = 600
        discussionsTableView.register(UINib(nibName: "DiscussionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "discussionHV")
        
    }
    
    func setupTableView() {
        discussionsTableView.register(UINib(nibName: "RepliesCell", bundle: nil), forCellReuseIdentifier: "repliesCell")
        discussionsTableView.register(UINib(nibName: "AddReplyCell", bundle: nil), forCellReuseIdentifier: "addReply")

    }
    
//    func getIdentifier(forRow row:Int) -> String {
//        switch row {
//        case 0:
//            return "discussionCell"
//        case 1:
//            return "testCell"
//        default:
//            return "discussionCell"
//        }
//
//    }
    
    @objc func handleExpandClose(button : UIButton)
    {
        

        let section = button.tag
        
        var indexPaths = [IndexPath]()
        //        if testList[section].replies.count > 0{
        for a in 0...(testList[section].replies.count){
            let indexPath = IndexPath(row: a, section: section)
            indexPaths.append(indexPath)
        }
        let isExpanded = testList[section].isExpanded
        testList[section].isExpanded = !isExpanded
        
        
        
        
        
        
        if isExpanded {
            
            button.setTitle("Replies (\(testList[section].replies.count)) 􀆈", for: .normal)
            discussionsTableView.deleteRows(at: indexPaths, with: .fade)
            
//                discussionsTableView.headerView(forSection: section)?.backgroundColor = .black
            
        }else{
            button.setTitle("Replies (\(testList[section].replies.count)) 􀆇", for: .normal)
            discussionsTableView.insertRows(at: indexPaths, with: .fade)
            
            
        }
        discussionsTableView.reloadData()


    }
    
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
        discussionsTableView.reloadData()
        
        
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
        discussionsTableView.reloadData()
        
        
    }
    
    @objc func dislikedReply(button : UIButton){
        let section = button.tag/10000
        let row = button.tag % 10000
                
        if !testList[section].replies[row].isDisliked{
            button.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
            testList[section].replies[row].dislike += 1
            testList[section].replies[row].isDisliked = true
            if testList[section].replies[row].isLiked{
                //                button.tintColor = .systemBlue
                testList[section].replies[row].isLiked = false
                testList[section].replies[row].like -= 1
                
            }
        }else{
            button.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
            testList[section].replies[row].dislike -= 1
            testList[section].replies[row].isDisliked = false
        }
        discussionsTableView.reloadData()
        
        
    }
    
    @objc func likedReply(button : UIButton){
        
        let section = button.tag / 10000
        let row = button.tag % 10000
        
        if !testList[section].replies[row].isLiked{
            button.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            testList[section].replies[row].like += 1
            testList[section].replies[row].isLiked = true
            if testList[section].replies[row].isDisliked{
                //                button.tintColor = .systemBlue
                testList[section].replies[row].isDisliked = false
                testList[section].replies[row].dislike -= 1
                
            }
        }else{
            button.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            testList[section].replies[row].like -= 1
            testList[section].replies[row].isLiked = false
        }
        discussionsTableView.reloadData()
    }
    
    @objc func pinned(button: UIButton){
        
        let section = button.tag
        
        if !testList[section].isPinned{
            button.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            testList[section].isPinned = true
        }else{
            button.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            testList[section].isPinned = false
        }
        discussionsTableView.reloadData()
        
    }
    
}
extension DiscussionVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !testList[section].isExpanded
        {
            return 0
        }
        return testList[section].replies.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        
        switch row{
        case testList[section].replies.count:
            if let cell = discussionsTableView.dequeueReusableCell(withIdentifier: "addReply") as? AddReplyCell{
                cell.containerView.layer.cornerRadius = 20
                return cell
            } else{
                return AddReplyCell()
            }
        default :
            if let cell = discussionsTableView.dequeueReusableCell(withIdentifier: "repliesCell") as? RepliesCell {
                cell.profileImage.image = testList[section].replies[row].profile
                cell.datePostLabel.text = testList[section].replies[row].datePost
                cell.profileName.text = testList[section].replies[row].name
                
                cell.likeCount.text = "\(testList[section].replies[row].like)"
                cell.dislikeCount.text = "\(testList[section].replies[row].dislike)"
                cell.profileImage.layer.cornerRadius = cell.profileImage.frame.height/2
                cell.replyLabel.text = testList[section].replies[row].replyContent
                cell.likeButton.tag = section*10000 + row
                cell.dislikeButton.tag = section*10000 + row
                cell.likeButton.addTarget(self, action: #selector(likedReply), for: .touchUpInside)
                cell.dislikeButton.addTarget(self, action: #selector(dislikedReply), for: .touchUpInside)
                
                if testList[section].replies[row].isLiked {
                    cell.likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
                    cell.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
                } else if testList[section].replies[row].isDisliked{
                    cell.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
                    cell.likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
                }
                
                
                           
                return cell
            
            } else {
                return RepliesCell()
            }
        }


    }
}

extension DiscussionVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        testList.count
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
//
        if let view = discussionsTableView.dequeueReusableHeaderFooterView(withIdentifier: "discussionHV") as? DiscussionHeaderView{
            
            view.profileName.text = testList[section].name
            view.discussionDateLabel.text = testList[section].datePost
            view.profileImage.image = testList[section].profile
            view.discussionLabel.text = testList[section].discussionContent
            view.discussionTitleLable.text = testList[section].discussionTitle
            view.likeCountLabel.text = "\(testList[section].like)"
            view.dislikeCountLabel.text = "\(testList[section].dislike)"
            //view.replyButton.titleLabel?.text = "Replies (\(testList[section].replies.count)) 􀆈"
            
            view.profileImage.layer.cornerRadius = view.profileImage.frame.height/2
            view.discussionView.layer.cornerRadius = 20
            view.layer.cornerRadius = 20
            
            view.backgroundCamoView.isHidden = true
            var viewExpanded = testList[section].isExpanded
            if viewExpanded{
                view.replyButton.setTitle("Replies (\(testList[section].replies.count)) 􀆇", for: .normal)
                view.backgroundCamoView.isHidden = false
            } else {
                view.replyButton.setTitle("Replies (\(testList[section].replies.count)) 􀆈", for: .normal)
                view.backgroundCamoView.isHidden = true
            }
            view.replyButton.tag = section
            view.likeButton.tag = section
            view.dislikeButton.tag = section
            view.pinnedButton.tag = section
            view.likeButton.addTarget(self, action: #selector(liked), for: .touchUpInside)
            view.dislikeButton.addTarget(self, action: #selector(disliked), for: .touchUpInside)
            view.replyButton.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
            view.pinnedButton.addTarget(self, action: #selector(pinned), for: .touchUpInside)
            
            if testList[section].isLiked {
                view.likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
                view.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
            } else if testList[section].isDisliked{
                view.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
                view.likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            }
            
            if testList[section].isPinned {
                view.pinnedButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else if !testList[section].isPinned {
                view.pinnedButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            }
            
            return view.contentView
        } else {
            return DiscussionHeaderView()
        }
    }
    
    

    
}

