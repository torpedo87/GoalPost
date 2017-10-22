//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by junwoo on 2017. 10. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var createGoalBtn: UIButton!
  @IBOutlet weak var pointsTextField: UITextField!
  var goalDescription: String!
  var goalType: GoalType!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createGoalBtn.bindToKeyboard()
    pointsTextField.delegate = self
  }
  
  func initData(description: String, type: GoalType) {
    self.goalDescription = description
    self.goalType = type
  }
  
  //core data 에 저장하기
  func save(completion: (_ finished: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    
    let goal = Goal(context: managedContext)
    goal.goalDescription = self.goalDescription
    goal.goalType = self.goalType.rawValue
    goal.goalCompletionValue = Int32(self.pointsTextField.text!)!
    goal.goalProgress = Int32(0)
    
    do {
      try managedContext.save()
      completion(true)
    } catch {
      completion(false)
      debugPrint("could not save: \(error.localizedDescription)")
    }
    
  }
  
  @IBAction func backBtnPressed(_ sender: Any) {
    dismissDetail()
  }
  
  @IBAction func createGoalBtnPressed(_ sender: Any) {
    if pointsTextField.text != "" {
      save { (success) in
        if success {
          dismiss(animated: true, completion: nil)
        }
      }
    }
  }
}
