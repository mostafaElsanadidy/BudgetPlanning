//
//  SecondProgressBar.swift
//  Zawidha
//
//  Created by mostafa elsanadidy on 10/19/20.
//

import UIKit


enum ProgressBarDirection {
    case FromRight
    case FromLeft
}

@IBDesignable
class SecondProgressBar: UIView {

    @IBInspectable var color: UIColor? = .gray
    private let progressLayer = CALayer()
    var progressBarDirection:ProgressBarDirection = .FromLeft{
        didSet{
            setNeedsDisplay()
        }
    }
    var isLayerBordered = false{
        didSet{
            setNeedsDisplay()
        }
    }
    
    let precentageLabel:UILabel = {
        var labl = UILabel()
          labl.translatesAutoresizingMaskIntoConstraints = false
        
       // addConstraint(horizontalConstraint)
          labl.textColor = .white
       // let labl = auctionDetailsCell.progressBar.precentageLabel
     //   labl.lineBreakMode = .byClipping
       // labl.text = "labl.textlabl.textlabl.textlabl.textlabl.textlabl.text"
//        labl.numberOfLines = 1
        labl.font = UIFont.init(name: "Cairo-Regular", size: 12)
        labl.adjustsFontSizeToFitWidth = true
        labl.minimumScaleFactor = 0.5
//
        labl.textAlignment = .center
        return labl
    }()
    
    let updateProfileBttn:UIButton = {
        var bttn = UIButton()
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.setTitleColor(.white, for: .normal)
        bttn.underline()
       // bttn.font = UIFont.systemFont(ofSize: 11)
        return bttn
    }()
    
    var progress: CGFloat = 0{
        didSet{
            
           //   progressLayer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1))
        //    self.semanticContentAttribute = .forceRightToLeft
            setNeedsDisplay()
        }
    }
    
//    // MARK: - setupXib Border
//    func setupXib() {
//        let bundle = Bundle(for: type(of: self))
//        let nibName = type(of: self).description().components(separatedBy: ".").last!
//        let nib = UINib(nibName: nibName, bundle: bundle)
//
//        // 1. Load the nib
//        self.containerView = nib.instantiate(withOwner: self, options: nil).first as? UIView
//
//        // 2. Set the bounds for the container view
//        self.containerView.frame = bounds
//        self.containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
//
//        // 3. Add this container view as the subview
//        addSubview(containerView)
//
//    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let backgroundMask = CAShapeLayer()
        backgroundMask.path = UIBezierPath.init(roundedRect: rect, cornerRadius: rect.height * 0.5).cgPath
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        layer.mask = backgroundMask
        if isLayerBordered{
//        layer.borderColor = UIColor.lightGray.cgColor
//            layer.borderColor = #colorLiteral(red: 0.2588235294, green: 0.537254902, blue: 0.8784313725, alpha: 1)
            layer.borderColor = #colorLiteral(red: 0.9960784314, green: 0.8039215686, blue: 0.8941176471, alpha: 1)
//            layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = rect.height*0.5}
        var progressRect = CGRect.init(origin: .zero, size: CGSize.init(width: rect.width * progress, height: rect.height))
        progressRect.origin.x = progressBarDirection == .FromLeft ? 0 : rect.width * (1-progress)
//
        
        
        progressLayer.frame = progressRect
       // layer.addSublayer(progressLayer)
        progressLayer.backgroundColor = color?.cgColor
        
//        precentageLabel.lineBreakMode = .byClipping
//        precentageLabel.numberOfLines = 1
//      //  precentageLabel.adjustsFontSizeToFitWidth = true
//        precentageLabel.minimumScaleFactor = 9
       // progressLayer.transform = CATransform3DMakeScale(-1, 1, 1)
       // self.semanticContentAttribute = .forceRightToLeft
       // self.addConstraints([NSLayoutConstraint(item: updatePr
//        progressLayer.transform
//        progressLayer.setAffineTransform(CGAffineTransform(rotationAngle: -CGFloat.pi/2))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
     //   progressLayer.setAffineTransform(CGAffineTransform(rotationAngle: -CGFloat.pi/2))
        layer.addSublayer(progressLayer)
        self.addSubview(precentageLabel)
        precentageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        precentageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.addConstraint(NSLayoutConstraint(item: precentageLabel, attribute: .trailing, relatedBy: .greaterThanOrEqual , toItem: self, attribute: .trailing, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: precentageLabel, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .leading, multiplier: 1, constant: 10))
//        precentageLabel.adjustsFontSizeToFitWidth = true
//        precentageLabel.minimumScaleFactor = 9
//        let horizontalConstraint = NSLayoutConstraint(item: precentageLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: self, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 5)
//        addConstraint(horizontalConstraint)
//        let trailing_constraint = precentageLabel.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: self.trailingAnchor, multiplier: 1)
//        trailing_constraint.constant = 5
//        trailing_constraint.isActive = true
        precentageLabel.bringSubviewToFront(self)
      //  self.semanticContentAttribute = .forceRightToLeft
       // self.addConstraints([NSLayoutConstraint(item: updateProfileBttn, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20)])
//        NSLayoutConstraint.activate([
//        updateProfileBttn.leadingAnchor.
//            constraint(co: 20)
//                            ])
     //   updateProfileBttn.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
     //   updateProfileBttn.bringSubviewToFront(self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.addSublayer(progressLayer)
        self.addSubview(precentageLabel)
        precentageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        precentageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addConstraint(NSLayoutConstraint(item: precentageLabel, attribute: .trailing, relatedBy: .greaterThanOrEqual , toItem: self, attribute: .trailing, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: precentageLabel, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .leading, multiplier: 1, constant: 10))
//        precentageLabel.adjustsFontSizeToFitWidth = true
//        precentageLabel.minimumScaleFactor = 9
//        let horizontalConstraint = NSLayoutConstraint(item: precentageLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: self, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 5)
//        addConstraints([horizontalConstraint])
//        let trailing_constraint = precentageLabel.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: self.trailingAnchor, multiplier: 1)
//        trailing_constraint.constant = 5
//        trailing_constraint.isActive = true
        precentageLabel.bringSubviewToFront(self)
       // self.addConstraints([NSLayoutConstraint(item: updateProfileBttn, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20)])
                                        
    //    updateProfileBttn.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
   //     updateProfileBttn.bringSubviewToFront(self)
    }
    
}
