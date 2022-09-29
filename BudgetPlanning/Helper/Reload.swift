//
//  Reload.swift
//  MadeInKuwait
//
//  Created by mostafa elsanadidy on 1/29/22.
//  Copyright © 2022 mostafa elsanadidy. All rights reserved.
//

import UIKit

protocol ReloadDelegate {
    func goToHomeVC(window:UIWindow)
}

extension ReloadDelegate {
    
    func goToHomeVC(window:UIWindow) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //LOGIN
        let tabBarController = storyboard.instantiateViewController(withIdentifier :"Tabbar_Controller") as! TabbarController
        //HOME
    
      //  let tabBarController = TabBarController()
        var arrOfVC:[UIViewController] = []
//            let arrOfVC_ID = ["HomeVC"]
//            
//            for vcIdentifier in arrOfVC_ID{
//                let viewController = storyboard.instantiateViewController(withIdentifier: vcIdentifier)
//                arrOfVC.append(viewController)
//            }
        arrOfVC.append(AboutMyBudgetVC())
        arrOfVC.append(MonthGoalVC())
        arrOfVC.append(HomeVC())
            tabBarController.viewControllers = arrOfVC
//        tabBarController.viewControllers?.append(HomeVC())
            //            // create the side controller
            //        let SideMenuVC = storyboard.instantiateViewController(withIdentifier: "SideMenuVC") as! SideMenuVC
        for (indx, VC) in tabBarController.viewControllers!.enumerated(){
           
            VC.tabBarItem = UITabBarItem.init(title: "", image: VC.configureTabBarImage(with: indx,isSelectedState: true), selectedImage: VC.configureTabBarImage(with: indx))
        }
        
       
        let navController = UINavigationController.init(rootViewController: tabBarController)
   
    
    window.rootViewController = navController
        window.makeKeyAndVisible()
    
//    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
//        
//        tabbarController.defaultState()
//        print(tabbarController.selectedIndex)
//        tabbarController.updateVCTabBarDot(vcIndex: 0)
//    })
    
    }
}
