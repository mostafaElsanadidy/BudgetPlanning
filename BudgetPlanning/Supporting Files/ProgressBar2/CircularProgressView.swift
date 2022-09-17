//
//  CircularProgressView.swift
//  CircularProgressView-Tutorial
//
//  Created by Aman Aggarwal on 20/05/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit

enum SavedBarDirection {
    case counterclockwise
    case clockwise
}

class CircularProgressView: UIView {

    fileprivate var progressLayer = CAShapeLayer()
    fileprivate var trackLayer = CAShapeLayer()
    
    var progress: CGFloat = 0{
        didSet {
            createCircularPath()
//            setNeedsDisplay()
        }
    }
  //  @IBInspectable var isSavedBarClockwise : [CGFloat] = [0.5,1.5]
    var flag = 0.5
//    var isSavedBAr = false{
//        didSet{
//            createCircularPath()
//        }
//    }
//    var savedBarTag:Int = 1000{
//        didSet{
//            createCircularPath()
//        }
//    }
    
    @IBInspectable var isClockWise: Bool = true{
        didSet {
            createCircularPath()
//            setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//         createCircularPath()
//    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    
    var progressColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    var trackColor = UIColor.white {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    fileprivate func createCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(( (2 * 1.0) - 0.5) * .pi), clockwise: false)
        let delay:CGFloat = 0.07
        let startAngle = isClockWise ?  CGFloat((-0.5+delay) * .pi) : CGFloat((1.5-delay) * .pi)
        let diff = isClockWise ? delay : -delay
        
//        UIBezierPath.ini
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width-1.5)/2, startAngle: startAngle , endAngle: CGFloat(( (2 * progress) - flag - diff) * .pi) , clockwise: isClockWise)
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 10.0
        trackLayer.strokeEnd = isClockWise ? 1.0 : 0.0
        layer.addSublayer(trackLayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 12
        progressLayer.strokeEnd = 0.0
        progressLayer.cornerRadius = 20
        progressLayer.lineCap = .round
        layer.addSublayer(progressLayer)
    }
    
    func setProgressWithAnimation(fromValue:Float, duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = fromValue
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateprogress")
    }
    
    

}
