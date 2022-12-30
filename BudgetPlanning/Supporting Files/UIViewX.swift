//
//  UIViewX.swift
//  Zawidha
//
//  Created by Mostafa on 12/21/20.
//

import UIKit

@IBDesignable
class UIViewX: UIView {
    
    // MARK: - Gradient
    
    @IBInspectable var firstColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var horizontalGradient: Bool = false {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [ firstColor.cgColor, secondColor.cgColor ]
        
        if (horizontalGradient) {
            layer.startPoint = CGPoint(x: 0.0, y: 0.5)
            layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    
    // MARK: - Border
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    
    @IBInspectable var leftTopRadius : CGFloat = 0{
           didSet{
               self.applyMask()
           }
       }
       @IBInspectable var rightTopRadius : CGFloat = 0{
           didSet{
               self.applyMask()
           }
       }
       @IBInspectable var rightBottomRadius : CGFloat = 0{
           didSet{
               self.applyMask()
           }
       }
       
       @IBInspectable var leftBottomRadius : CGFloat = 0{
           didSet{
               self.applyMask()
           }
       }
}

extension UIViewX{
 

       
       override func layoutSubviews() {
           super.layoutSubviews()
           self.applyMask()
       }
       
       // Only override draw() if you perform custom drawing.
       // An empty implementation adversely affects performance during animation.
       /*override func draw(_ rect: CGRect) {
           super.draw(rect)

       }*/
       
       func applyMask()
       {
           let shapeLayer = CAShapeLayer(layer: self.layer)
           shapeLayer.path = self.pathForCornersRounded(rect:self.bounds).cgPath
           shapeLayer.frame = self.bounds
           shapeLayer.masksToBounds = true
           self.layer.mask = shapeLayer
       }
       
       func pathForCornersRounded(rect:CGRect) ->UIBezierPath
       {
           let path = UIBezierPath()
           path.move(to: CGPoint(x: 0 + leftTopRadius , y: 0))
           path.addLine(to: CGPoint(x: rect.size.width - rightTopRadius , y: 0))
           path.addQuadCurve(to: CGPoint(x: rect.size.width , y: rightTopRadius), controlPoint: CGPoint(x: rect.size.width, y: 0))
           path.addLine(to: CGPoint(x: rect.size.width , y: rect.size.height - rightBottomRadius))
           path.addQuadCurve(to: CGPoint(x: rect.size.width - rightBottomRadius , y: rect.size.height), controlPoint: CGPoint(x: rect.size.width, y: rect.size.height))
           path.addLine(to: CGPoint(x: leftBottomRadius , y: rect.size.height))
           path.addQuadCurve(to: CGPoint(x: 0 , y: rect.size.height - leftBottomRadius), controlPoint: CGPoint(x: 0, y: rect.size.height))
           path.addLine(to: CGPoint(x: 0 , y: leftTopRadius))
           path.addQuadCurve(to: CGPoint(x: 0 + leftTopRadius , y: 0), controlPoint: CGPoint(x: 0, y: 0))
           path.close()
           
           return path
       }
       
}
