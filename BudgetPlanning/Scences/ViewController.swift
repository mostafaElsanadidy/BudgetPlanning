//
//  ViewController.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 06.08.22.
//

import UIKit

class ViewController: UIViewController {

    let selectedIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        let selectedIndex = 1
            tabBarItem.title = ""
     //        setup_Collection()
            tabBarItem.image = configureTabBarImage(with:selectedIndex,isSelectedState: true)
            tabBarItem.selectedImage = configureTabBarImage(with: selectedIndex)
            tabBarController?.selectedIndex = selectedIndex
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        guard let tabBBarVC = self.tabBarController as? TabbarController else { return }
//        if let vc = tabBBarVC.viewControllers?.map({$0 as? FirstViewController}).filter({$0 != nil}),vc != []{
//        
//            guard let vcIndex = tabBBarVC.viewControllers?.firstIndex(of: vc[0]!) else{return}
//            vc[0]!.tabBarItem = UITabBarItem.init(title: "", image: self.configureTabBarImage(with: vcIndex, imageColor: #colorLiteral(red: 0.4549019608, green: 0.5411764706, blue: 0.6156862745, alpha: 1)), selectedImage: vc[0]!.configureTabBarImage(with: vcIndex, imageColor: #colorLiteral(red: 1, green: 0.6470588235, blue: 0.4039215686, alpha: 1)))
//            print(vcIndex)}
//    }

}

