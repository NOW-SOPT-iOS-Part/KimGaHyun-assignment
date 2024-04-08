//
//  FontLiterals.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

enum FontName: String {
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardThin = "Pretendard-Thin"
    case pretendardLight = "Pretendard-Light"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
    case pretendardBlack = "Pretendard-Black"
    case pretendardBold = "Pretendard-Bold"
    case pretendardExtraBold = "Pretendard-ExtraBold"
    case pretendardExtraLight = "Pretendard-ExtraLight"
    
}

extension UIFont {
    @nonobjc class func pretendardSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardSemiBold.rawValue, size: size)!
    }
    
    @nonobjc class func pretendardThin(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardThin.rawValue, size: size)!
    }
    
    @nonobjc class func pretendardLight(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardLight.rawValue, size: size)!
    }
    
    @nonobjc class func pretendardMedium(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardMedium.rawValue, size: size)!
    }
    
    @nonobjc class func pretendardRegular(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardRegular.rawValue, size: size)!
    }
    
    @nonobjc class func pretendardBlack(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardBlack.rawValue, size: size)!
    }
    
    @nonobjc class func pretendardBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardBold.rawValue, size: size)!
    }
    
    @nonobjc class func pretendardExtraBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardExtraBold.rawValue, size: size)!
    }
    
    @nonobjc class func pretendardExtraLight(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardExtraLight.rawValue, size: size)!
    }
}
