//
//  FontLiterals.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

extension UIFont {
    static func pretendardFont(weight: CGFloat, size: CGFloat) -> UIFont {
            let fontName: String
            switch weight {
                case 100:
                    fontName = "Pretendard-Thin"
                case 200:
                    fontName = "Pretendard-ExtraLight"
                case 300:
                    fontName = "Pretendard-Light"
                case 400:
                    fontName = "Pretendard-Regular"
                case 500:
                    fontName = "Pretendard-Medium"
                case 600:
                    fontName = "Pretendard-SemiBold"
                case 700:
                    fontName = "Pretendard-Bold"
                case 800:
                    fontName = "Pretendard-ExtraBold"
                case 900:
                    fontName = "Pretendard-Black"
                default:
                    fatalError("Invalid weight")
            }
            
            guard let font = UIFont(name: fontName, size: size) else {
                fatalError("Font not found")
            }
            return font
        }
}
