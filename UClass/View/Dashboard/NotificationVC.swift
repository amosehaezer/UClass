//
//  NotificationVC.swift
//  UClass
//
//  Created by Josia Mannuel on 26/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {
    
    @IBOutlet weak var notificationTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notificationTable.dataSource = self
        self.notificationTable.delegate = self
        
        notificationTable.rowHeight = UITableView.automaticDimension
        notificationTable.estimatedRowHeight = 600
        
        setupTableView()
    }
    
    func setupTableView() {
        notificationTable.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: getIdentifier(forSection: 0))
    }
    
    func getIdentifier(forSection section:Int) -> String {
        switch section {
        case 0:
            return "notificationCell"
        default:
            return "notificationCell"
        }
    }
    
    
    
}

extension NotificationVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = notificationTable.dequeueReusableCell(withIdentifier: getIdentifier(forSection: indexPath.section), for: indexPath) as? NotificationCell {
            return cell
        } else {
            return NotificationCell()
        }
    }
    
    
}

extension NotificationVC: UITableViewDelegate {
    
    
}
