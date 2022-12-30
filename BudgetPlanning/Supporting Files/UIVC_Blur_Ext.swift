//
//  UIVC_Blur_Ext.swift
//  Zawidha
//
//  Created by Maher on 10/6/20.
//

import UIKit
//import NVActivityIndicatorView

extension UIViewController {
    
    
    func set_Blur(containerView : UIView) {
        // 1
       // view.backgroundColor = .clear
        // 2
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        // 3
        let blurView = UIVisualEffectView(effect: blurEffect)
        // 4
        blurView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(blurView)

    }
    
    // MARK: - Animate In
     func animateIN(animation:@escaping ()->()) {
                    UIView.animateKeyframes(withDuration: 0.3, delay: 0.15, animations: animation)
        }
        
        // MARK: - Animate Out
     func animateOut(animation:@escaping ()->(),completion:@escaping (Bool)->()) {
            
            UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: .beginFromCurrentState, animations: animation
                , completion: completion)
        }
    
    func fixOrientation(img: UIImage) -> UIImage {
        if (img.imageOrientation == .up) {
            return img
        }

        UIGraphicsBeginImageContextWithOptions(img.size, false, img.scale)
        let rect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
        img.draw(in: rect)

        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return normalizedImage
    }
}
