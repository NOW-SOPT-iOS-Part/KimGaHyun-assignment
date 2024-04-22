//
//  String+.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/18.
//

import UIKit

extension String {
    func hasCharacters() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[가-힣ㄱ-ㅎㅏ-ㅣ]$", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            }
        } catch {
            print(error.localizedDescription)
            return false
        }

        return false
    }
}
