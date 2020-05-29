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
let CLASS_REF = DB_REF.collection("classes")
let db = Firestore.firestore()

struct User {
    
    var uid: String = ""
    var name: String = ""
    var email: String = ""
    var role: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case uid
        case name
        case email
        case role
    }
}

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
    
    func addClass(classData: [String:Any], completion: @escaping() -> Void) {
        CLASS_REF.addDocument(data: classData) { (error) in
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
    
    func oneUserData(uid: String, fetchUser: @escaping(_ result: User?) -> Void ) {
        let read = db.collection("users").whereField("uid", isEqualTo: uid)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    return
                }
                    guard let x = querySnapshot?.documents.first?.data() else {return fetchUser(nil)}
                    guard let email = x["email"] as? String else {return}
//                        self.getEmail(email: email)
                    guard let name = x["name"] as? String else {return}
                    guard let uid = x["uid"] as? String else {return}
                    guard let role = x["role"] as? Int else {return}
                    fetchUser(User(uid: uid, name: name, email: email, role: role))
        }
    }
    
    
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
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
