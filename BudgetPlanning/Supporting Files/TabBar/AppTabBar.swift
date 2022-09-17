//
//  File.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 07.08.22.
//
import UIKit
import Foundation

@IBDesignable
class AppTabBar: UITabBar {

    private var shapeLayer: CALayer?
    var didStyleTabBar = false
    
    
    var selectedIndex = 3 {
        didSet{
//            self.setNeedsDisplay()
//            semanticContentAttribute = .forceRightToLeft
//            self.setNeedsLayout()
            self.setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        if !didStyleTabBar{
        self.invalidateIntrinsicContentSize()
        var tabFrame = self.frame

        tabFrame.size.height = tabFrame.height
        tabFrame.origin.y = (self.superview?.frame.size.height ?? 0)-tabFrame.height-45
//                    tabFrame.origin.y = 100
            self.frame = tabFrame
            didStyleTabBar = true
        }
        self.addShape(selectedIndex: selectedIndex)
        
    }

    func addShape(selectedIndex:Int) {
        
//        self.layer.transform = CATransform3DIdentity
//        self.layer.transform = CATransform3DMakeTranslation(0, -100, 1.0)
        
        let shapeLayer = CAShapeLayer()
         shapeLayer.path = createPath(selectedIndex: selectedIndex)
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0.4588235294, blue: 0.8901960784, alpha: 1)
        shapeLayer.lineWidth = 0.5
        shapeLayer.shadowOffset = CGSize(width:0, height:0)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 0.3

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }

    func createPath(selectedIndex:Int) -> CGPath {
        
//        print(self.selectedItem)
        let height: CGFloat = 86.0
      //  print(self.subviews[2].frame.origin)
        let path = UIBezierPath()
        print(self.selectedIndex)
//        self.selectedItem.
        
        let centerWidth = (self.subviews[self.selectedIndex].frame.origin.x)+(self.subviews[self.selectedIndex].frame.width/2)
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height ), y: 0))
        path.addCurve(to: CGPoint(x: centerWidth, y: height - 15),
                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: height - 15))
        path.addCurve(to: CGPoint(x: (centerWidth + height ), y: 0),
                      controlPoint1: CGPoint(x: centerWidth + 35, y: height - 15), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }
        return nil
    }
}

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 74
        return sizeThatFits
    }
}
