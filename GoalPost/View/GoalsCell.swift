//
//  GoalsCell.swift
//  GoalPost
//
//  Created by junwoo on 2017. 10. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit

class GoalsCell: UITableViewCell {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var progressLabel: UILabel!
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func configureCell(description: String, type: GoalType, goalProgress: Int) {
    self.descriptionLabel.text = description
    self.typeLabel.text = type.rawValue
    self.progressLabel.text = String(describing: goalProgress)
  }
  
}