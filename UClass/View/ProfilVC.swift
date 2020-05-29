//
//  ProfilViewController.swift
//  UClass
//
//  Created by Dorojatun Kuncoro Yekti Raharjo on 21/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit
import FirebaseAuth

struct ProfilData{
    var LabelName: String?
    var DataName: String
    
    init(LabelName: String? ,DataName: String) {
        self.DataName = DataName
        self.LabelName = LabelName

    }
}


class ProfilVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageProfil: UIImageView!
    
    @IBOutlet weak var dataProfil: UITableView!
    
       var profilData = [ProfilData]()
    
    var profilName: String = "budi"
    var profilEmail: String = " toni"
    var profilImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       imageProfil.layer.cornerRadius = imageProfil.frame.height/2
        imageProfil.image = #imageLiteral(resourceName: "profile-4")
        self.imageProfil.layer.masksToBounds = true
        self.imageProfil.clipsToBounds = true
        
        dataProfil.rowHeight = UITableView.automaticDimension
        dataProfil.estimatedRowHeight = 600
        
        
        var email: String = ""
        let id = Auth.auth().currentUser?.uid
        var name: String = ""
        
        Services.shared.oneUserData(uid: id!) { (result) in
            DispatchQueue.main.async {
                if result != nil {
                    name = result?.name as! String
                    email = result?.email as! String
//                    print("\(name)    \(email)")
                } else {
                    print("DEBUG: User not found!")
                }
            }
        }
        
        print("\(name)    \(email)")
        profilData.append(ProfilData(LabelName: "Name", DataName: "Selena Strange"))
        profilData.append(ProfilData(LabelName: "Email", DataName: "selena.s@gmail.com"))
        
        self.dataProfil.delegate = self
        self.dataProfil.dataSource = self
        
       dataProfil.layer.cornerRadius = 20
//       dataProfil.layer.masksToBounds = true
        setupTableView()
        
         
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changePicture(_ sender: Any) {
        let image = UIImagePickerController()
              image.delegate = self
              image.sourceType = UIImagePickerController.SourceType.photoLibrary
              image.allowsEditing = false
              self.present(image,animated: true){
                  //image loaded
              }
    }
    @IBAction func changePassword(_ sender: Any) {
        
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        Services.shared.signOut()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginVC
        self.present(newViewController, animated: true, completion: nil)
//        performSegue(withIdentifier: "login", sender: nil)
//        self.dismiss(animated: true, completion: nil)
    }
    
    func profileTemp(name: String, email: String) {
        print("\(email)      \(name)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTableView(){
        dataProfil.register(UINib(nibName: "ProfilViewCell", bundle: nil), forCellReuseIdentifier: getIdentifier(forSection: 0))
    }
    
    
    func getIdentifier(forSection section: Int) -> String
    {
        switch section {
        case 0:
            return "ProfilViewCell"
        default:
            return "ProfilViewCell"

        }
    }

}

extension ProfilVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dataProfil.dequeueReusableCell(withIdentifier: "ProfilViewCell", for: indexPath) as? ProfilViewCell else { fatalError("Error")}
        cell.Label.text = profilData[indexPath.row].LabelName
        cell.profilData.text = profilData[indexPath.row].DataName
        if indexPath.row == 1{
            cell.separator.isHidden = true
        }
//        cell.profilData.layer.cornerRadius = 10
       
        
        return cell
        
    }
    
    
}
extension ProfilVC: UITableViewDelegate{
    
}
