//
//  UIView+.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

extension UIView {
    
    /// 한 번에 여러 개의 UIView 또는 UIView의 하위 클래스 객체들을 상위 UIView에 추가
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
