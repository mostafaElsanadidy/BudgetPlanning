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
    fileprivate var segmentLayers = [CAShapeLayer]()
    
    fileprivate var circlePath = UIBezierPath()
    var precentages = [0.2,0.4,0.1,0.2,0.1]
    var colors:[UIColor] = [.red, .blue , .brown , .white, .cyan]
    
    var progress: CGFloat = 0{
        didSet {
            createCircularPath()
//            setNeedsDisplay()
        }
    }
  //  @IBInspectable var isSavedBarClockwise : [CGFloat] = [0.5,1.5]
    var flag = 0.5
    var isSegmented = false
    var index = 0
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
    override func draw(_ rect: CGRect) {
//         createCircularPath()

        let delay:CGFloat = isSegmented ? 0.0 : 0.05

        self.configureCirclePath(delay: delay)
        trackLayer.path = circlePath.cgPath
        progressLayer.path = circlePath.cgPath
//        segmentLayers = []
//        layer.sublayers = []
        for layer in segmentLayers {
            layer.path = circlePath.cgPath
        }
//        circleLayer.path = circlePath.cgPath
    }
    
    
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
    
//    deinit {
//        segmentLayers = []
//        layer.sublayers = []
//    }
    fileprivate func createCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(( (2 * 1.0) - 0.5) * .pi), clockwise: false)
        
        if !isSegmented{
            let delay:CGFloat = 0.05
            configureCirclePath(delay: delay)
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
            layer.addSublayer(progressLayer)}
        
//        let rect = rectForShape()
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x:rect.midX , y: rect.midY), radius: CGFloat(10), startAngle: CGFloat(50), endAngle: CGFloat(Double.pi * 2), clockwise: true)
//
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = circlePath.cgPath
//        // Change the fill color
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        // You can change the stroke color
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        // You can change the line width
//        shapeLayer.lineWidth = 3.0
//        view.layer.addSublayer(shapeLayer)
        //MARK: - Draw a circular segment progress in SWIFT
//        let circlePath = UIBezierPath(ovalInRect: CGRect(x: 200, y: 200, width: 150, height: 150))
        guard isSegmented else { return }
//        trackLayer.isHidden = true
//        progressLayer.isHidden = true
////        var segments: [CAShapeLayer] = []
//        let segmentAngle: CGFloat = (360 * 0.125) / 360
//        let circle_Path = UIBezierPath(ovalIn: CGRect(x:frame.size.width/2, y: frame.size.height/2, width: 150, height: 150))
//        let delay:CGFloat = 0.05
//        let startAngle = isClockWise ?  CGFloat(-0.5 * .pi) : CGFloat(1.5 * .pi)
//        let diff = isClockWise ? delay : -delay
//
//        for i in 0 ... 4{
//
//            let segment = CAShapeLayer()
////            segment.path = circlePath.cgPath
//            let pro:CGFloat = CGFloat(i+1/8)
//            let lastPro:CGFloat = CGFloat((i)/8)
//            let diff = isClockWise ? delay : -delay
////            circlePath = UIBezierPath.init(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width)/2, startAngle: CGFloat(( (2 * lastPro) - 0.5) * .pi) , endAngle: CGFloat(( (2 * pro) - 0.5 - 0.02) * .pi) , clockwise: isClockWise)
////            circlePath.addArc(withCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width-1.5)/2, startAngle: CGFloat(( (2 * lastPro) - 0.5-diff) * .pi) , endAngle: CGFloat(( (2 * pro) - 0.5) * .pi) , clockwise: isClockWise)
////            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width-1.5)/2, startAngle: CGFloat(( (2 * lastPro) - 0.5) * .pi) , endAngle: CGFloat(( (2 * pro) - 0.5) * .pi) , clockwise: isClockWise)
//            segment.path = circle_Path.cgPath
//            segment.lineWidth = 10
//            segment.strokeColor = progressColor.cgColor
////            UIColor(red:0,  green:0.004,  blue:0.549, alpha:1).cgColor
//            segment.fillColor = UIColor.clear.cgColor
////            circleLayer.fillColor = UIColor.clear.cgColor
//
//            // start angle is number of segments * the segment angle
//           // segment.strokeStart = segmentAngle * CGFloat(i)
//            // end angle is the start plus one segment, minus a little to make a gap
//            // you'll have to play with this value to get it to look right at the size you need
//            let gapSize: CGFloat = 0.008
////            segment.strokeStart = segmentAngle * CGFloat(i-1)
////            segment.strokeEnd = 0.0
//            segment.strokeEnd = 0.0
////            segment.strokeStart + segmentAngle - gapSize
//            // add the segment to the segments array and to the view
//            segmentLayers.insert(segment, at: i)
//            layer.addSublayer(segmentLayers[i])
//
////            progressLayer.addSublayer(segment)
//
////            circleLayer.addSublayer(segment)
////            if i == 8{
////                circlePath = UIBezierPath()
////            }
//        }
//        layer.addSublayer(circleLayer)
//        let circlePath = UIBezierPath(ovalInRect: CGRect(x: 200, y: 200, width: 150, height: 150))
        resetProgressBar()
        var segments: [CAShapeLayer] = []
//        let segmentAngle: CGFloat = (360 * 0.125) / 360
        var circlePaths = [UIBezierPath]()
//        segmentLayers = []
        let delay:CGFloat = 0.0
        configureCirclePath(delay: delay)
        var currentValue = 0.0
        for var i in 0...precentages.count - 1 {
            
//            let startAngle = ((CGFloat(2) * segmentAngle * CGFloat(i))-0.5) * .pi
//            let gapSize: CGFloat = 0.008
//            let endAngle = CGFloat(2)*(startAngle + segmentAngle - gapSize) - 0.5 * .pi
//            let segmentAngle: CGFloat = (360 * precentages[i]) / 360
           
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath

           

            // end angle is the start plus one segment, minus a little to make a gap
            // you'll have to play with this value to get it to look right at the size you need
            let gapSize: CGFloat = 0.04
            let strokeStart:CGFloat = currentValue
            let strokeEnd:CGFloat = strokeStart + CGFloat(Float(precentages[i])) - gapSize
            currentValue = strokeEnd + gapSize
            
            print(strokeStart,strokeEnd)
            // start angle is number of segments * the segment angle
            circleLayer.strokeStart = strokeStart
            circleLayer.strokeEnd = strokeEnd

            circleLayer.lineWidth = 12
            circleLayer.strokeColor = UIColor.clear.cgColor
            circleLayer.fillColor = UIColor.clear.cgColor

            circleLayer.cornerRadius = 20
            circleLayer.lineCap = .round
            
            // add the segment to the segments array and to the view
//            if segmentLayers.count == precentages.count {
//                segmentLayers.insert(circleLayer, at: i)
//            }
            print(i)
            segmentLayers.insert(circleLayer, at: i)
//            layer.sublayers[i] = segmentLayers[i]
            
        }
        layer.sublayers = segmentLayers
    }
    
    fileprivate func configureCirclePath(delay:CGFloat){
        
        let startAngle = isClockWise ?  CGFloat((-0.5+delay) * .pi) : CGFloat((1.5-delay) * .pi)
        let diff = isClockWise ? delay : -delay
        
////        UIBezierPath.ini
//        if isSegmented{
////            circlePath.addArc(withCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width-1.5)/2, startAngle: CGFloat(( (2 * lastPro) - 0.5) * .pi) , endAngle: CGFloat(( (2 * pro) - 0.5) * .pi) , clockwise: isClockWise)
//        }else{
            circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width-1.5)/2, startAngle: startAngle , endAngle: CGFloat(( (2 * progress) - flag - diff) * .pi) , clockwise: isClockWise)
//
//    }
        
//        for i in 1...segmentLayers.count{
//            circlePath.addArc(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width-1.5)/2, startAngle: startAngle , endAngle: CGFloat(( (2 * i/8) - flag - diff) * .pi) , clockwise: isClockWise)}
        
        
    }
    
    
    func setProgressWithAnimation(fromValue:Float, duration: TimeInterval, value: Float,color:UIColor = .white) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.fromValue = fromValue
        animation.toValue = value
        
        if !isSegmented{
            
        progressLayer.strokeEnd = CGFloat(value)
            progressLayer.add(animation, forKey: "animateprogress")
    }
        else{
        
           
//        guard let sublayers = progressLayer.sublayers as? [CAShapeLayer]
//        ,let layerIndex = segmentLayers.firstIndex(where:{
//                                    $0.strokeStart == CGFloat(fromValue)})
//        else { return }
            
            guard index <= segmentLayers.count-1 else{
                index = 0
//                segmentLayers[index].strokeColor = UIColor.clear.cgColor
//                segmentLayers = []
//                layer.sublayers = []
                return
            }
//            if segmentLayers[index].value(forKey: "animateprogress") == nil
//            {
            
//            print(value)
//            print("\(index) oijjl")
            segmentLayers[index].strokeColor = color.cgColor
                
//            }else{
//                segmentLayers[index].strokeColor = UIColor.blue.cgColor
//            }
            
            print(fromValue,value)
            segmentLayers[index].strokeStart = CGFloat(fromValue)
        segmentLayers[index].strokeEnd = CGFloat(value)
//            segmentLayers[index].animation(forKey: "animateprogress")
            
//            segmentLayers[index].setValue(animation, forKey: "animateprogress")
            segmentLayers[index].add(animation, forKey: "animateprogress")
            index += 1
        }
//            guard let sublayers = progressLayer.sublayers else { return }
//            for (i,layer) in sublayers.enumerated() {
//                guard let shapeLayer = layer as? CAShapeLayer else { return }
////                shapeLayer.strokeStart = shapeLayer.strokeStart
//
//                let segmentAngle: CGFloat = (360 * 0.125) / 360
////                animation.fromValue = fromValue
////                animation.toValue = value
//                animation.fromValue = segmentAngle * CGFloat(i)
//                let gapSize: CGFloat = 0.008
//                animation.toValue = shapeLayer.strokeStart + segmentAngle - gapSize
//                shapeLayer.strokeEnd = shapeLayer.strokeEnd
//                progressLayer.sublayers![i].add(animation, forKey: "animateprogress")
//            }
////            circleLayer.strokeEnd = CGFloat(value)
////            circleLayer.add(animation, forKey: "animateprogress")
//        }
//        completion()
    }
    func resetProgressBar(){
        
        index = 0
        for layer in segmentLayers {
            
            layer.removeAllAnimations()
        }
        for layerr in layer.sublayers ?? []{
            layerr.removeAllAnimations()
        }
        segmentLayers = []
        layer.sublayers = []
//        layer.removeAllAnimations()
    }
    
//    func setSegmentedProgressWithAnimation(fromValue:Float, duration: TimeInterval, value: Float) {
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.duration = duration
//        animation.fromValue = fromValue
//        animation.toValue = value
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
//        circleLayer.strokeEnd = CGFloat(value)
//        circleLayer.add(animation, forKey: "animateprogress")
////        completion()
//    }

}
