//
//  Label_Ext.swift
//  Zawidha
//
//  Created by Maher on 10/5/20.
//

import UIKit

extension UILabel {
    func underline() {
        if let textString = self.text {
          let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
          attributedText = attributedString
        }
    }

        func calculateMaxLines() -> Float {
//            let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
            let charSize = Int(font.lineHeight)
//            let text = (self.text ?? "") as NSString
//            let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
            
            let titleHeight = self.font.sizeOfString(string: self.text!, constrainedToWidth: Double(frame.size.width), font: self.font).height
            let max_Size = CGSize(width: frame.size.width, height: titleHeight)
            print(Int(max_Size.height)/charSize)
            let linesRoundedUp = Float(max_Size.height)/Float(charSize)
            return linesRoundedUp
        }
    
    func calculate_MaxLines() -> Int {
            let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
            let charSize = font.lineHeight
            let text = (self.text ?? "") as NSString
            let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
            let linesRoundedUp = Int(ceil(textSize.height/charSize))
            return linesRoundedUp
        }

    
}


extension UIFont {
    func sizeOfString (string: String, constrainedToWidth width: Double, font:UIFont) -> CGSize {
        return NSString(string: string).boundingRect(
            with: CGSize(width: width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: self],
            context: nil).size
    }
}
