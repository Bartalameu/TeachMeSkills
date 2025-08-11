//
//  PaddingLabel.swift
//  homework_12
//
//  Created by Vadzim Pappkou on 09.08.2025.
//

import UIKit

class PaddingLabel: UILabel {
    var textInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetBounds = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetBounds, limitedToNumberOfLines: numberOfLines)
        return textRect.inset(by: UIEdgeInsets(top: -textInsets.top,
                                              left: -textInsets.left,
                                              bottom: -textInsets.bottom,
                                              right: -textInsets.right))
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}
