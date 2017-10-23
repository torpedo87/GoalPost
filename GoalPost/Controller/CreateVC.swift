//
//  CreateVC.swift
//  GoalPost
//
//  Created by junwoo on 2017. 10. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit

class CreateVC: UIViewController {

  @IBOutlet weak var goalTextView: UITextView!
  @IBOutlet weak var shortTermBtn: UIButton!
  @IBOutlet weak var longTermBtn: UIButton!
  @IBOutlet weak var nextBtn: UIButton!
  var goalType: GoalType = .shortTerm
  
  override func viewDidLoad() {
    super.viewDidLoad()
    goalTextView.delegate = self
    nextBtn.bindToKeyboard()
    shortTermBtn.setSelectedColor()
    longTermBtn.setDeselectedColor()
  }

  @IBAction func backBtnPressed(_ sender: Any) {
    dismissDetail()
  }
  @IBAction func longTermBtnPressed(_ sender: Any) {
    goalType = .longTerm
    longTermBtn.setSelectedColor()
    shortTermBtn.setDeselectedColor()
  }
  @IBAction func shortTermBtnPressed(_ sender: Any) {
    goalType = .shortTerm
    shortTermBtn.setSelectedColor()
    longTermBtn.setDeselectedColor()
  }
  @IBAction func nextBtnPressed(_ sender: Any) {
    if goalTextView.text != "" && goalTextView.text != "what is your goal" {
      guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
      
      finishGoalVC.initData(description: goalTextView.text, type: goalType)
      
      //presentingVC = GoalsVC
      //GoalsVC가 CreateVC를 닫고 FinishGoalVC를 연다
      presentingViewController?.presentSecondaryDetail(finishGoalVC)
    }
  }
}

extension CreateVC: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    goalTextView.text = ""
    goalTextView.textColor = UIColor.black
  }
}
