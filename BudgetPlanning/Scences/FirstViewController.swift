//
//  FirstViewController.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 08.08.22.
//

import UIKit

class FirstViewController: UIViewController {

    let selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        guard let badgeView = tabBarController?.tabBar.badgeViewForItem(at: 0) else{return}
//        badgeView.backgroundColor = #colorLiteral(red: 0.9707236886, green: 0.742860198, blue: 0.8405991197, alpha: 1)
//        badgeView.layer.transform = CATransform3DIdentity
//        badgeView.layer.transform = CATransform3DMakeTranslation(30, -7, 1.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
//        let selectedIndex = 0
        tabBarItem.title = ""
//        setup_Collection()
        tabBarItem.image = configureTabBarImage(with: selectedIndex,isSelectedState: true)
        tabBarItem.selectedImage = configureTabBarImage(with: selectedIndex)
        tabBarController?.selectedIndex = selectedIndex
        
    }
 
}

