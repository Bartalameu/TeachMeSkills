//
//  UITexViewPadding.swift
//  homework_12
//
//  Created by Vadzim Pappkou on 10.08.2025.
//

import UIKit


class UITextFieldPadding : UITextField {

  let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
  
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}
