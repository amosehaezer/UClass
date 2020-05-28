//
//  StudentViewVC.swift
//  UClass
//
//  Created by Dorojatun Kuncoro Yekti Raharjo on 26/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

class StudentVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var studentTable: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var students = [StudentViewCell(),StudentViewCell()]
    
    var searchStudents = [StudentViewCell()]
    var searchEnabled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.studentTable.dataSource = self
        self.studentTable.delegate = self
        
        studentTable.rowHeight = UITableView.automaticDimension
        studentTable.estimatedRowHeight = 600
        
        setupTableView()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func editPressed(_ sender: UIBarButtonItem) {
        
        studentTable.isEditing = !studentTable.isEditing
        
        if studentTable.isEditing{
            editButton.title = "Done"
              editButton.tintColor = .systemBlue
        }else{
            editButton.title = "Edit"
            editButton.tintColor = .systemBlue
          
        }
        
    }
    
    @IBAction func bakButton2(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    func setupTableView(){
        studentTable.register(UINib(nibName: "StudentViewCell", bundle: nil), forCellReuseIdentifier: getIdentifier(forSection: 0))
    }
    
    func getIdentifier(forSection section: Int) -> String {
        switch section {
        case 0:
            return "StudentViewCell"
        default:
            return "StudentViewCell"
        }
    }

}
extension StudentVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = studentTable.dequeueReusableCell(withIdentifier: getIdentifier(forSection: indexPath.section), for: indexPath) as? StudentViewCell{
            return cell
        }
        else{
            return StudentViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let selectedItem = students[sourceIndexPath.row]
        students.remove(at: sourceIndexPath.row)
        students.insert(selectedItem, at: sourceIndexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            students.remove(at: indexPath.row)
            studentTable.reloadData()
        }
        
    }
    
}

 extension StudentVC: UITableViewDelegate {
            
}

extension StudentVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //searchStudents = students.filter({$0.lowercased().prefix(searchText.count == searchText.lowercased())})
        searchEnabled = true
        studentTable.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchEnabled = false
        searchBar.text = ""
        studentTable.reloadData()
    }
}
