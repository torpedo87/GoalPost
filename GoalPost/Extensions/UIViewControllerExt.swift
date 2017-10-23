//
//  UIViewControllerExt.swift
//  GoalPost
//
//  Created by junwoo on 2017. 10. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func presentDetail(_ viewControllerToPresent: UIViewController) {
    let transition = CATransition()
    transition.duration = 0.3
    transition.type = kCATransitionPush
    transition.subtype = kCATransitionFromRight
    self.view.window?.layer.add(transition, forKey: kCATransition)
    
    //animated 를 true로 하면 디폴트 애니메이션이 동작하므로 위에서 만든 custom animation 사용하려면 false
    present(viewControllerToPresent, animated: false, completion: nil)
  }
  
  func dismissDetail() {
    let transition = CATransition()
    transition.duration = 0.3
    transition.type = kCATransitionPush
    transition.subtype = kCATransitionFromLeft
    self.view.window?.layer.add(transition, forKey: kCATransition)
    
    dismiss(animated: false, completion: nil)
  }
  
  func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
    let transition = CATransition()
    transition.duration = 0.3
    transition.type = kCATransitionPush
    transition.subtype = kCATransitionFromRight
    
    //presentedVC = CreateVC
    guard let presentedViewController = presentedViewController else { return }
    
    //현재 뷰컨트롤러가 dismiss 되고나서 곧바로 다음 뷰로 이동
    presentedViewController.dismiss(animated: false) {
      self.view.window?.layer.add(transition, forKey: kCATransition)
      self.present(viewControllerToPresent, animated: false, completion: nil)
    }
  }
}
