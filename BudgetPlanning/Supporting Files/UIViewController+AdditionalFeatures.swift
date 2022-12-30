//
//  UIViewController+AdditionalFeatures.swift
//  MadeinKuwait-Driver
//
//  Created by mostafa elsanadidy on 4/18/20.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

extension UIViewController{
    
    
   
    var beforeItTabBarVC:String{return self.beforeItTabBarVC}
    
    func showAlert(title:String,message:String){
           
       let alert = UIAlertController(title: title,
                                     message: message,
                                     preferredStyle: .alert)
                                         
       let action = UIAlertAction(title: "Ok",
                                  style: .default,
                                  handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
           return 
       }
    
    
    func pushViewController(id:String = "" , VC:UIViewController! = nil){
      
        if VC != nil{
            self.navigationController?.pushViewController(VC , animated: true)
        }else if id != ""{
        let homeVC = self.storyboard!.instantiateViewController(withIdentifier :id)
        //present(homeVC, animated: true, completion: nil)
            self.navigationController?.pushViewController(homeVC , animated: true)}
    }
    
    
    @objc func popVCFromNav(){
        
    self.navigationController?.popViewController(animated: true)
    }
    
    func configureTabBarImage(with selectedIndx:Int, isSelectedState:Bool = false) -> UIImage{
              var imageName = ""
        var renderingMode:UIImage.RenderingMode = .alwaysOriginal
          
        var height:CGFloat = 50
        var lblText = ""
            switch selectedIndx{
            case 0:
                height = 25
                imageName = "budget3"
                lblText = "Plans"
            case 1:
                height = 25
                imageName = "doollar"
                imageName = "budget"
                imageName = "wallet2"
//                imageName = "mybudget2"
                lblText = "Wallet"
            case 2:
                height = 30
//                imageName = "MOney-sign"
//                imageName = "climb stairs"
                imageName = "Growth-Icon"
                imageName = "progresss"
//                imageName = "target4"
//                imageName = "Growth-Icon"
//                imageName = "progress4"
                lblText = "MonthGoal"
            case 3:
                height = 45
                imageName = "target1"
//                imageName = "budget planing"
                lblText = "Goals"
            default:
                height = 30
                imageName = "MOney-sign"
            }
            
        let view = UIView.init(frame: CGRect.init(x: 0, y: -100, width: 90, height: 90))
                     
//        view.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.5411764706, blue: 0.6156862745, alpha: 1)
//        view.layer.cornerRadius = 60/2
                                  
        let imageView = UIImageView.init(frame: CGRect.init(x: view.frame.size.width/2-height/2,y: view.frame.size.height/2-height/2, width: height, height: height))
//        imageView.backgroundColor = isSelectedState ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
//        imageView.layer.cornerRadius = imageView.frame.width/2
        
//        var realColor = UIColor()
//
//        if imageColor == #colorLiteral(red: 0.4549019608, green: 0.5411764706, blue:            0.6156862745, alpha: 1){
//                realColor = .white
//              }else{
//                realColor = #colorLiteral(red: 1, green: 0.6470588235, blue: 0.4039215686, alpha: 1)
//              }
        
        let imageColor = isSelectedState ?  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.3769466577) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
//        let image = isSelectedState ? UIImage(named: imageName)?.withTintColor(imageColor, renderingMode: renderingMode) : UIImage(named: imageName)
        let image = UIImage(named: imageName)?.withTintColor(imageColor, renderingMode: renderingMode)
//        let image = UIImage(named: imageName)
                      
        imageView.image = image
        imageView.contentMode = .scaleToFill
//        if selectedIndx == 1{
//            imageView.contentMode = .scaleToFill
//        }
        imageView.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)

        view.addSubview(imageView)
        
        //like as badgeView
//        if !isSelectedState{
            
            let label = UILabel(frame: CGRect(x: imageView.frame.origin.x+imageView.frame.width/2-10, y: imageView.frame.origin.y-20, width: view.frame.width, height: 30))
            if selectedIndx == 3 {
                label.frame.origin.y = imageView.frame.origin.y-15
            }
            label.frame.origin.y = imageView.frame.height+imageView.frame.origin.y+5
            if selectedIndx == 3 {
                label.frame.origin.y = imageView.frame.height+imageView.frame.origin.y-5
            }
            label.frame.origin.x = view.frame.origin.x
            label.textAlignment = .center
        label.textColor = imageColor
//        label.text = "●"
            label.text = lblText
//            label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: label.font.fontName, size: 15)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
//            label.isHidden = true
           // label.layer.cornerRadius = 20/2
            view.addSubview(label)
            view.bringSubviewToFront(label)
            
//        }
//        view.backgroundColor = .brown
        
         return view.asImage().withRenderingMode(renderingMode)
        
    }
    
}


