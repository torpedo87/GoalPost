//
//  GoalsVC.swift
//  GoalPost
//
//  Created by junwoo on 2017. 10. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit
import CoreData

//어디서나 접근할 수 있는 appdelegate 만들기
let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var goals: [Goal] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetch { (success) in
      if success {
        if goals.count >= 1 {
          self.tableView.isHidden = false
        } else {
          tableView.isHidden = true
        }
        self.tableView.reloadData()
      }
    }
  }
  
  @IBAction func addGoalBtnPressed(_ sender: Any) {
    guard let createVC = storyboard?.instantiateViewController(withIdentifier: "CreateVC") else { return }
    presentDetail(createVC)
  }
}

extension GoalsVC: UITableViewDelegate {
  
}

extension GoalsVC: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return goals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalsCell") as? GoalsCell else {
      return UITableViewCell()
    }
    if goals.count >= 1 {
      let goal = goals[indexPath.row]
      cell.configureCell(goal: goal)
    }
    return cell
  }
}

extension GoalsVC {
  func fetch(completion: (_ success:Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    
    let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
    do {
      goals = try managedContext.fetch(fetchRequest)
      completion(true)
    } catch {
      debugPrint("could not fetch: \(error.localizedDescription)")
      completion(false)
    }
    
  }
}
