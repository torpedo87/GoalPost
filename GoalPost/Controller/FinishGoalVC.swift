//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by junwoo on 2017. 10. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit

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
  
  
  @IBAction func createGoalBtnPressed(_ sender: Any) {
    
  }
}
