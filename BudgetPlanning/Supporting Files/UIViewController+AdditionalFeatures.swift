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
            switch selectedIndx{
            case 0:
                imageName = "dollar"
            case 1:
                height = 50
                imageName = "dollar"
            case 2:
                height = 70
//                imageName = "MOney-sign"
                imageName = "target"
            case 3:
                height = 45
                imageName = "doollar"
            default:
                height = 30
                imageName = "MOney-sign"
            }
            
        let view = UIView.init(frame: CGRect.init(x: 0, y: -100, width: 90, height: 90))
                     
//        view.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.5411764706, blue: 0.6156862745, alpha: 1)
//        view.layer.cornerRadius = 60/2
                                  
        let imageView = UIImageView.init(frame: CGRect.init(x: view.frame.size.width/2-height/2,y: view.frame.size.height/2-height/2, width: height, height: height))
        
        
//        var realColor = UIColor()
//
//        if imageColor == #colorLiteral(red: 0.4549019608, green: 0.5411764706, blue:            0.6156862745, alpha: 1){
//                realColor = .white
//              }else{
//                realColor = #colorLiteral(red: 1, green: 0.6470588235, blue: 0.4039215686, alpha: 1)
//              }
        
        let imageColor = isSelectedState ? #colorLiteral(red: 0.5955441594, green: 0.6747867465, blue: 0.7344350815, alpha: 1) : #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        let image = isSelectedState ? UIImage(named: imageName)?.withTintColor(imageColor, renderingMode: renderingMode) : UIImage(named: imageName)
//        let image = UIImage(named: imageName)?.withTintColor(imageColor, renderingMode: renderingMode)
                      
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        //like as badgeView
        if !isSelectedState{
            
        let label = UILabel(frame: CGRect(x: imageView.frame.origin.x+imageView.frame.width/2-10, y: imageView.frame.origin.y-22, width: 20, height: 20))
            if selectedIndx == 2{
                label.frame.origin.y = imageView.frame.origin.y - 10
            }
        label.textAlignment = .center
        label.textColor = .white
        label.text = "●"
        label.font = UIFont(name: label.font.fontName, size: 23)
           // label.layer.cornerRadius = 20/2

            view.addSubview(label)
            view.bringSubviewToFront(label)
        }
        
       
        
         return view.asImage().withRenderingMode(renderingMode)
    
    }
    
}


