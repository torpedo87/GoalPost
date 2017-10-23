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
    fetchCoreData()
    tableView.reloadData()
  }
  
  @IBAction func addGoalBtnPressed(_ sender: Any) {
    guard let createVC = storyboard?.instantiateViewController(withIdentifier: "CreateVC") else { return }
    presentDetail(createVC)
  }
  
  func fetchCoreData() {
    fetch { (success) in
      if success {
        if goals.count >= 1 {
          self.tableView.isHidden = false
        } else {
          tableView.isHidden = true
        }
      }
    }
  }
}

extension GoalsVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
    return .none
  }
  
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
      self.removeGoal(atIndexPath: indexPath)
      self.fetchCoreData()
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    deleteAction.backgroundColor = UIColor.red
    
    let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
      self.setProgress(atIndexPath: indexPath)
      tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    addAction.backgroundColor = #colorLiteral(red: 0.9385011792, green: 0.7164435983, blue: 0.3331357837, alpha: 1)
    
    return [deleteAction, addAction]
  }
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
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  
}

extension GoalsVC {
  //fetch coreData
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
  
  //delete coreData
  func removeGoal(atIndexPath indexPath: IndexPath) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    
    managedContext.delete(goals[indexPath.row])
    
    do {
      try managedContext.save()
    } catch {
      debugPrint("could not delete: \(error.localizedDescription)")
    }
    
  }
  
  //update coredata
  func setProgress(atIndexPath indexPath: IndexPath) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    
    let chosenGoal = goals[indexPath.row]
    if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
      chosenGoal.goalProgress += 1
    } else {
      return
    }
    
    do {
      try managedContext.save()
    } catch {
      debugPrint("could not set progress: \(error.localizedDescription)")
    }
  }
}
