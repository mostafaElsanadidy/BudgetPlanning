//
//  FuturePurchasesCell.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 09.08.22.
//

import UIKit

class FuturePurchasesCell: UICollectionViewCell {

    @IBOutlet weak var progressBar: SecondProgressBar!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    var borderLayer = CAShapeLayer()
    var progressBArDirection:ProgressBarDirection = .FromLeft
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureProgressBar(direction: progressBArDirection)
    }

    override func draw(_ rect: CGRect) {
       
//        UIApplicationShortcutItem.init(type: <#T##String#>, localizedTitle: <#T##String#>)
        if let imageView = self.viewWithTag(130){
        //    imageView.layer.cornerRadius = 20
//            imageView.clipsToBounds = true
            
        //    borderLayer.path = path.cgPath
//            borderLayer.lineWidth = 10
//            borderLayer.strokeColor = UIColor.red.cgColor
//            borderLayer.fillColor = UIColor.white.cgColor
//            borderLayer.frame = imageView.bounds
//            imageView.layer.addSublayer(borderLayer)
//            imageView.layer.sublayers = [borderLayer]
//            let mask = CAShapeLayer()
//            mask.path = path.cgPath
//                imageView.layer.mask = borderLayer
        }
        
        if let view = self.viewWithTag(120){
            view.layer.cornerRadius = 8
            view.layer.shadowPath = view.createRectangle()
//            view.layer.mask = borderLayer
//            view.roundCorners([.allCorners], radius: 30.0, borderColor: UIColor.white, borderWidth: 10.0)
            
        }
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if let imageView = self.viewWithTag(130){
            imageView.backgroundColor = .red
        }
        
       configureProgressBar(direction: progressBArDirection)
    }
    
    func configureProgressBar(direction:ProgressBarDirection){
        self.progressBar.progressBarDirection = direction
//        if progressBArDirection == .FromLeft{
        let progress = 0.7
        progressBar.progress = progress
        progressBar.precentageLabel.text = "%\(Int(progress*100))"
        progressBar.precentageLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        progressBar.precentageLabel.font = UIFont.systemFont(ofSize: 15, weight: .black)
        progressBar.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        progressBar.color = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
//        FECDE4   E87AA4
        
//        }
//        else{
//        progressBar.progress = 0.3
//        progressBar.precentageLabel.text = "%\(Int((1-0.7)*100))"
//        progressBar.precentageLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        progressBar.precentageLabel.font = UIFont.systemFont(ofSize: 15, weight: .black)
//        progressBar.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
//        progressBar.color = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        }
    }
}

extension UIView{
    func createRectangle() -> CGPath {
        // Initialize the path.
        
        
        self.layer.cornerRadius = 8
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 4.0
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 6.0))
        path.addLine(to: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2))
        print(self.bounds.width)
        path.addLine(to: CGPoint(x: self.bounds.width, y: 6.0))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height+5.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.bounds.height+5.0))
        
        
        
        return path.cgPath
    }
    
        func roundCorners(_ corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
//            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0.0, y: 6.0))
            path.addLine(to: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2))
            print(self.bounds.width)
            path.addLine(to: CGPoint(x: self.bounds.width, y: 6.0))
            path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height+5.0))
            path.addLine(to: CGPoint(x: 0.0, y: self.bounds.height+5.0))
            
            let mask = CAShapeLayer()
            mask.path = path.cgPath
//            self.layer.mask = mask

//            let borderPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
           
        }
}
