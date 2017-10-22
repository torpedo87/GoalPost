//
//  GoalsVC.swift
//  GoalPost
//
//  Created by junwoo on 2017. 10. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
  }
  
  @IBAction func addGoalBtnPressed(_ sender: Any) {
  }
}

extension GoalsVC: UITableViewDelegate {
  
}

extension GoalsVC: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
      return UITableViewCell()
    }
    cell.configureCell(description: "eat salad twice a week", type: .longTerm, goalProgress: 3)
    return cell
  }
}
