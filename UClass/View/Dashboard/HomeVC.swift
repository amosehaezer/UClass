//
//  HomeVCViewController.swift
//  MC2
//
//  Created by Vincentius Calvin on 26/05/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit


struct testSubject {
    
    var classname : String
    var classmember : [String]
    var classSubject : String
    var teacher : String
    var isExpanded : Bool
    var assignments : [Assignment]
    
}

struct currentUser {
    
    var role : String
    var email : String
    var name : String
    var profileImage : String
    
}

struct Assignment {
    var assignmentName: String
    var discussionsCount: Int
    var lastDiscussed: String
}

class HomeVC: UIViewController {
    
    
    var testUser = currentUser(role: "student", email: "anitamiles@yahoo.com", name: "Anita Miles", profileImage: "profile-1")
    
    var subjectList = [
        testSubject(classname: "XII IPA 4", classmember: ["anitamiles@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"], classSubject: "Mathematics", teacher: "Prof. Selena Strange", isExpanded: false, assignments: [Assignment(assignmentName: "Integral", discussionsCount: 11,lastDiscussed: "Sunday, 2 May 2020"),Assignment(assignmentName: "Integral 2", discussionsCount: 5, lastDiscussed: "Monday, 10 May 2020"),Assignment(assignmentName: "Integral 3", discussionsCount: 12, lastDiscussed: "Wednesday, 12 May 2020"),Assignment(assignmentName: "Turunan 1", discussionsCount: 2, lastDiscussed: "Friday, 14 May 2020")]),
        testSubject(classname: "XII IPA 4", classmember: ["anitamiles@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"], classSubject: "Physics", teacher: "Granger Dubois", isExpanded: false, assignments: [Assignment(assignmentName: "Velocity", discussionsCount: 5,lastDiscussed: "Monday, 3 May 2020"),Assignment(assignmentName: "Gaya", discussionsCount: 22, lastDiscussed: "Wednesday, 12 May 2020"),Assignment(assignmentName: "Momentum", discussionsCount: 7, lastDiscussed: "Wednesday, 12 May 2020")]),
        testSubject(classname: "XII IPA 4", classmember: ["anitamiles@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"], classSubject: "Chemistry", teacher: "Nolan Breger", isExpanded: false, assignments: [Assignment(assignmentName: "Stoikiometri", discussionsCount: 11,lastDiscussed: "Sunday, 2 May 2020")]),
        testSubject(classname: "XII IPA 4", classmember: ["anitamiles@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"], classSubject: "Bahasa Indonesia", teacher: "Budi Dabudi Budiman", isExpanded: false, assignments: [Assignment(assignmentName: "Puisi", discussionsCount: 5,lastDiscussed: "Sunday, 2 May 2020"),Assignment(assignmentName: "Prosa", discussionsCount: 8,lastDiscussed: "Thursday, 6 May 2020")]),
        testSubject(classname: "XII IPA 5", classmember: ["dadidu@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"], classSubject: "Mathematics", teacher: "Prof. Selena Strange", isExpanded: false, assignments: [Assignment(assignmentName: "Integral", discussionsCount: 11,lastDiscussed: "Sunday, 2 May 2020")]),
        testSubject(classname: "XII IPA 1", classmember: ["dadidu@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"], classSubject: "Mathematics", teacher: "Prof. Selena Strange", isExpanded: false, assignments: [Assignment(assignmentName: "Integral", discussionsCount: 11,lastDiscussed: "Sunday, 2 May 2020")]),
        testSubject(classname: "XII IPA 3", classmember: ["dadidu@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"], classSubject: "Mathematics", teacher: "Prof. Selena Strange", isExpanded: false, assignments: [Assignment(assignmentName: "Integral", discussionsCount: 11,lastDiscussed: "Sunday, 2 May 2020")]),
    ]
    
    public var userSubject : [testSubject] = []

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var homeProfileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nonLetters  = CharacterSet.letters.inverted
        let name = (testUser.name.components(separatedBy: nonLetters).first)!
        homeProfileImage.image = UIImage(named: testUser.profileImage)
        homeProfileImage.layer.cornerRadius = homeProfileImage.frame.height/2
        if testUser.role == "student"{
            roleLabel.text = "Student"
        } else {roleLabel.text = "Teacher"}
        welcomeLabel.text = "Hello, \(name)"
        headerView.layer.cornerRadius = 20
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        editButton.layer.cornerRadius = 12

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        //discussionsTableView.layer.cornerRadius = 20
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 600
        tableView.register(UINib(nibName: "ClassSection", bundle: nil), forHeaderFooterViewReuseIdentifier: "classSection")
        tableView.register(UINib(nibName: "AssignmentHomeCell", bundle: nil), forCellReuseIdentifier: "assignmentCell")
        if testUser.role == "student"{
            editButton.isHidden = true
            for a in subjectList{
                for name in a.classmember{
                    if name == testUser.email{
                        userSubject.append(a)
                    }
                }
            }
            
        } else if testUser.role == "teacher"{
            editButton.isHidden = false
            for a in subjectList{
                if a.teacher == testUser.name{
                    userSubject.append(a)
                }
            }
        }
    }
    

    
//    @objc func expanded(){
//
//
//
//
//    }
    

    

}
extension HomeVC: UITableViewDataSource {
    
    @objc func expanded(button: UIButton){
        
 
    
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        if userSubject[section].assignments.count > 0{
            for a in 0...(userSubject[section].assignments.count-1){
                let indexPath = IndexPath(row: a, section: section)
                indexPaths.append(indexPath)
            }
            let isExpanded = userSubject[section].isExpanded
            userSubject[section].isExpanded = !isExpanded
            
            
            if isExpanded {
                
                tableView.deleteRows(at: indexPaths, with: .fade)

            } else {
                tableView.insertRows(at: indexPaths, with: .fade)
            
        }
            

        }
        tableView.reloadData()

        
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !userSubject[section].isExpanded
        {
            return 0
        }
        return userSubject[section].assignments.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row

        if let cell = tableView.dequeueReusableCell(withIdentifier: "assignmentCell") as? AssignmentHomeCell {
            cell.assignmentTitleLabel.text = userSubject[section].assignments[row].assignmentName
            cell.totalDiscussionLabel.text = "Discussions: \(userSubject[section].assignments[row].discussionsCount)"
            cell.lastRepliedTimeLabel.text = "Last Replied: \(userSubject[section].assignments[row].lastDiscussed)"
            if row == userSubject[section].assignments.count-1{
                cell.containerView.layer.cornerRadius = 20
                cell.separatorLine.isHidden = true
            } else {
                cell.containerView.layer.cornerRadius = 0
                cell.separatorLine.isHidden = false
            }
            return cell
        }
        else { return AssignmentHomeCell() }
    }
}

extension HomeVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return userSubject.count

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
        
        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "classSection") as? ClassSection{
            view.containerView.layer.cornerRadius = 20
            
            if testUser.role == "student"{
                view.bergerButton.isHidden = true
                view.subjectLabel.text = userSubject[section].classSubject
                view.subjectDetailLabel.text = userSubject[section].teacher
            } else {
                view.subjectLabel.text = userSubject[section].classname
                view.subjectDetailLabel.text = userSubject[section].classSubject
            }
            
            
            
            let viewExpanded = userSubject[section].isExpanded
            if viewExpanded{

                view.backgroundCamoView.isHidden = false
            } else {

                view.backgroundCamoView.isHidden = true
            }
            view.expandButton.tag = section
            view.expandButton.addTarget(self, action: #selector(expanded), for: .touchUpInside)
            //view.expandButton.addTarget(self, action: #selector(expanded), for: .touchUpInside)
            return view.contentView
        } else {
            return ClassSection()
        }
        
    }

}
