//
//  HomeVCViewController.swift
//  MC2
//
//  Created by Vincentius Calvin on 26/05/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit
import FirebaseAuth
//import FirebaseFirestore


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

class HomeVC: UIViewController, AddClassData {
    
    
    var testUser = currentUser(role: "teacher", email: "anitamiles@yahoo.com", name: "Prof. Selena Strange", profileImage: "profile-4")
    
    var subjectList = [
        testSubject(classname: "XII IPA 4",
                    classmember: ["anitamiles@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"],
                    classSubject: "Mathematics", teacher: "Prof. Selena Strange", isExpanded: false,
                    assignments: [Assignment(assignmentName: "Integral", discussionsCount: 11,lastDiscussed: "Sunday, 2 May 2020"),
                                  Assignment(assignmentName: "Integral 2", discussionsCount: 5, lastDiscussed: "Monday, 10 May 2020"),
                                  Assignment(assignmentName: "Integral 3", discussionsCount: 12, lastDiscussed: "Wednesday, 12 May 2020"),
                                  Assignment(assignmentName: "Turunan 1", discussionsCount: 2, lastDiscussed: "Friday, 14 May 2020")]),
        testSubject(classname: "XII IPA 4",
                    classmember: ["anitamiles@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"],
                    classSubject: "Physics", teacher: "Granger Dubois", isExpanded: false,
                    assignments: [Assignment(assignmentName: "Velocity", discussionsCount: 5,lastDiscussed: "Monday, 3 May 2020"),
                                  Assignment(assignmentName: "Gaya", discussionsCount: 22, lastDiscussed: "Wednesday, 12 May 2020"),
                                  Assignment(assignmentName: "Momentum", discussionsCount: 7, lastDiscussed: "Wednesday, 12 May 2020")]),
        testSubject(classname: "XII IPA 4",
                    classmember: ["anitamiles@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"],
                    classSubject: "Chemistry", teacher: "Nolan Breger", isExpanded: false,
                    assignments: [Assignment(assignmentName: "Stoikiometri", discussionsCount: 11,lastDiscussed: "Sunday, 2 May 2020")]),
        testSubject(classname: "XII IPA 4",
                    classmember: ["anitamiles@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"],
                    classSubject: "Bahasa Indonesia", teacher: "Budi Dabudi Budiman", isExpanded: false,
                    assignments: [Assignment(assignmentName: "Puisi", discussionsCount: 5,lastDiscussed: "Sunday, 2 May 2020"),
                                  Assignment(assignmentName: "Prosa", discussionsCount: 8,lastDiscussed: "Thursday, 6 May 2020")]),
        testSubject(classname: "XII IPA 5",
                    classmember: ["dadidu@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"],
                    classSubject: "Mathematics", teacher: "Prof. Selena Strange", isExpanded: false,
                    assignments: [Assignment(assignmentName: "Integral", discussionsCount: 11,lastDiscussed: "Sunday, 2 May 2020")]),
        testSubject(classname: "XII IPA 1",
                    classmember: ["dadidu@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"],
                    classSubject: "Mathematics", teacher: "Prof. Selena Strange", isExpanded: false,
                    assignments: [Assignment(assignmentName: "Integral", discussionsCount: 11,lastDiscussed: "Sunday, 2 May 2020")]),
        testSubject(classname: "XII IPA 3",
                    classmember: ["dadidu@yahoo.com", "roberto@yahoo.com","lilianjane@yahoo.com","alibaba@yahoo.com"],
                    classSubject: "Mathematics", teacher: "Prof. Selena Strange", isExpanded: false,
                    assignments: [Assignment(assignmentName: "Integral", discussionsCount: 11,lastDiscussed: "Sunday, 2 May 2020")]),
    ]
    
    public var userSubject : [testSubject] = []
    

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var homeProfileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var className: String? = "Josia"
    var classSubject: String? = "Mannuel"
    var studentsEmail: [String]? = [""]
    
    var templist: [testSubject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        firstInit()
        let nonLetters  = CharacterSet.letters.inverted
        let name = (testUser.name.components(separatedBy: nonLetters).first)!
        
//        let id = Auth.auth().currentUser?.uid
//        var name = Services.shared.oneUserData(uid: id!)
        
        homeProfileImage.image = UIImage(named: testUser.profileImage)
        homeProfileImage.layer.cornerRadius = homeProfileImage.frame.height/2
        if testUser.role == "student"{
            roleLabel.text = "Student"
        } else {roleLabel.text = "Teacher"}
        print(name)
        
        welcomeLabel.text = "Hello, \(name)"
        headerView.layer.cornerRadius = 20
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        editButton.layer.cornerRadius = 12

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
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
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func editClass(_ sender: UIButton) {
        let actionsheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let deleteClass = UIAlertAction(title: "Delete class", style: .destructive){ action in
            
        }
        
        let addClass = UIAlertAction(title: "Add Class", style: .default){ action in
            self.AddClassPage()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionsheet.addAction(addClass)
        actionsheet.addAction(deleteClass)
        actionsheet.addAction(cancel)
        
        present(actionsheet, animated: true, completion: nil)
        
    }
    
    func firstInit() {
        
        var data: [String: Any]
        var assignment: String = ""
        
        data = [
            "courseName": "Mathematics",
            "courseClass": "XII IPA 4",
            "ownerID": "",
            "Assignment" : [assignment],
        ]
        
        Services.shared.addUser(userData: data) {
            print("DEBUG: add Data Success")
        }
    }
    
    func AddClassPage() {
        performSegue(withIdentifier: "toAddClass", sender: UIButton.self)
    }
    
    func sendClassData(className: String, classSubject: String, studentsEmail: [String]) {
        addClassToList(className: className, classSubject: classSubject, studentsEmail: studentsEmail)
        tableView.reloadData()
        print(subjectList)
    }
    
    func addClassToList(className: String, classSubject: String, studentsEmail: [String]){
        userSubject.append(testSubject(classname: className, classmember: studentsEmail, classSubject: classSubject, teacher: "Prof. Selena Strange", isExpanded: false, assignments: []))
    }
    
    @objc func showActionSheet(){
           let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
           
           let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           
        let viewStudents = UIAlertAction(title: "View Students", style: .default){ action in
            self.performSegue(withIdentifier: "viewStudents", sender: self)
        }
           
           let addTopic = UIAlertAction(title: "Add Topic", style: .default){ action in
               self.performSegue(withIdentifier: "addTopic", sender: self)
           }
           
           let deleteTopic = UIAlertAction(title: "Delete Topic", style: .destructive, handler: nil)
           
           actionSheet.addAction(cancel)
           actionSheet.addAction(viewStudents)
           actionSheet.addAction(addTopic)
           actionSheet.addAction(deleteTopic)
           
           present(actionSheet, animated: true, completion: nil)
       }
    
    
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
               
           } else {
               indexPaths.append(IndexPath(row: 0, section: section))
           }
           
           let isExpanded = userSubject[section].isExpanded
           userSubject[section].isExpanded = !isExpanded
           
           
           if isExpanded {
               
               tableView.deleteRows(at: indexPaths, with: .fade)

           } else {
               tableView.insertRows(at: indexPaths, with: .fade)
           }
           tableView.reloadData()

       }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if testUser.role == "teacher" && userSubject[section].assignments.count == 0{
            if !userSubject[section].isExpanded {
                return 0
            } else {return 1}
        } else {
            if !userSubject[section].isExpanded
            {
                return 0
            }
            return userSubject[section].assignments.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row

        if let cell = tableView.dequeueReusableCell(withIdentifier: "assignmentCell") as? AssignmentHomeCell {
            
            if userSubject[section].assignments.count == 0{
                cell.assignmentTitleLabel.text = "You don't have any topic yet."
                cell.totalDiscussionLabel.text = "Press ... to add a new topic."
                cell.lastRepliedTimeLabel.text = ""
                //cell.totalDiscussionLabel.font = UIFont(name: cell.totalDiscussionLabel.font.fontName, size: 12)
                
                cell.containerView.layer.cornerRadius = 20
                //cell.lastRepliedTimeLabel.isHidden = true
                //cell.totalDiscussionLabel.isHidden = true
                cell.separatorLine.isHidden = true
                
            } else {
                //cell.lastRepliedTimeLabel.isHidden = false
                //cell.totalDiscussionLabel.isHidden = false
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
            }
            return cell
        }
        else { return AssignmentHomeCell() }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "insideTopic", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "insideTopic" {
            let it = segue.destination as! InsideTopicVC
        } else if segue.identifier == "toAddClass" {
            let c = segue.destination as! AddClassVC
            c.className = self.className
            c.classSubject = self.classSubject
            c.studentsEmail = self.studentsEmail
            c.delegate = self
            c.instaceHVC = self
        }
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
            view.bergerButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
            return view.contentView
        } else {
            return ClassSection()
        }
        
    }

}
