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
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func backBtnPressed(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  @IBAction func longTermBtnPressed(_ sender: Any) {
  }
  @IBAction func shortTermBtnPressed(_ sender: Any) {
  }
  @IBAction func nextBtnPressed(_ sender: Any) {
  }
}
