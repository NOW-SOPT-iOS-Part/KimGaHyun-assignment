//
//  UIStackView+.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/29.
//

import UIKit

extension UIStackView {
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
}
