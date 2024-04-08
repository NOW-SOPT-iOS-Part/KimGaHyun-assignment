//
//  NSObject+.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
