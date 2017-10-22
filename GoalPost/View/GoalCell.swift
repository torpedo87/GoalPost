//
//  GoalCell.swift
//  GoalPost
//
//  Created by junwoo on 2017. 10. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
  
  @IBOutlet weak var goalProgressLabel: UILabel!
  @IBOutlet weak var goalTypeLabel: UILabel!
  @IBOutlet weak var goalDescriptionLabel: UILabel!
  
  func configureCell(description: String, type: String, goalProgress: Int) {
    self.goalDescriptionLabel.text = description
    self.goalTypeLabel.text = type
    self.goalProgressLabel.text = String(describing: goalProgress)
  }
}
