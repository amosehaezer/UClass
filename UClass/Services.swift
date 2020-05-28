//
//  Services.swift
//  UClass
//
//  Created by Amos Ebenhaezer on 27/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

let DB_REF = Firestore.firestore()
let USER_REF = DB_REF.collection("users")
let DISCUSSION_REF = DB_REF.collection("discussions")
let COURSE_REF = DB_REF.collection("courses")
let COMMENT_REF = DB_REF.collection("comments")
let db = Firestore.firestore()

struct Services {
    static let shared = Services()
    
    func addUser(userData: [String:Any], completion: @escaping() -> Void) {
        USER_REF.addDocument(data: userData) { (error) in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            completion()
        }
    }
    func addCourse(courseData: [String:Any], completion: @escaping() -> Void) {
        COURSE_REF.addDocument(data: courseData) { (error) in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            completion()
        }
    }
    
    func addDiscussion(discussionData: [String:Any], completion: @escaping() -> Void) {
        DISCUSSION_REF.addDocument(data: discussionData) { (error) in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            completion()
        }
    }
    
    func addComment(commentData: [String:Any], completion: @escaping() -> Void) {
        COMMENT_REF.addDocument(data: commentData) { (error) in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            completion()
        }
    }
    
    func oneUserData(uid: String) -> String {
        var name: String = ""
        
        
        let data = db.collection("users").whereField("uid", isEqualTo: uid)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    name = ""
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
//                        name = "\(document?.data(as: name.self))"
                    }
                }
        }
        return name
    }
    
    
    func login(email: String, pass: String) -> Int {
        var temp: Int = 0
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if error == nil {
//                    print("You have successfully logged in")
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
//                    self.present(vc!, animated: true, completion: nil)
                let alertController = UIAlertController(title: "Success", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
//                self.check(as: true)
                temp = 200
//              self.present(alertController, animated: true, completion: nil)
            } else {
//                self.check(as: false)
//                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                alertController.addAction(defaultAction)
                temp = 0
//                print(user)
//              self.present(alertController, animated: true, completion: nil)
            }
        }
//        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alertController.addAction(defaultAction)
//        temp = 0
//        print(user)
        return temp
    }
}
