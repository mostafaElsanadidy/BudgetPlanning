//
//  Tabbar_Controller.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 11.08.22.
//

import UIKit

class TabbarController: UITabBarController,UITabBarControllerDelegate {
    
    //Outlets
    
    var isVisitor:Bool = false
    var isForceToLogout:Bool = false
    var addAnotherUDID:Bool = false
    var progressBarValue:Float = 0
    
    var didStyleTabBar = false
   
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(redirectToSideMenu), name: Notification.Name(rawValue: "showSideMenu"), object: nil)
        
        self.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first

        guard let root = keyWindow?.rootViewController else {
            return
        }
        let topSafeArea: CGFloat
        let bottomSafeArea: CGFloat

        if #available(iOS 11.0, *) {
            topSafeArea = root.view.safeAreaInsets.top
            bottomSafeArea = root.view.safeAreaInsets.bottom
        } else {
            topSafeArea = root.topLayoutGuide.length
            bottomSafeArea = root.bottomLayoutGuide.length
        }

        print("topSafeArea : \(topSafeArea)")
        print("bottomSafeArea : \(bottomSafeArea)")

    }
    
    func defaultState(){
        for viewController in viewControllers ?? []{
            viewController.tabBarItem.badgeValue = ""
            viewController.tabBarItem.badgeColor = .clear
            viewController.tabBarItem.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
            let attributes = [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-UltraLight", size: 20)]
            viewController.tabBarItem.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        }
    }
    //MARK: -
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.defaultState()
        tabBar.semanticContentAttribute = .forceRightToLeft
    }
    
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        
        defaultState()
        guard let vcIndex = viewControllers?.firstIndex(of: viewController) else{return}
        print(vcIndex)
//        DispatchQueue.main.asyncAfter(deadline: .now()){
//            if let indexes = self.viewControllers?.enumerated().filter({$0.element == viewController}).map({$0.offset}){
//             print(indexes)
////
//                if vcIndex != 0{
//                    self.updateVCTabBarDot(vcIndex: vcIndex)}
//         }}
        
//        if let tabBar = self.tabBar as? AppTabBar{
//            tabBar.selectedIndex = vcIndex
//            tabBar.setNeedsDisplay()
//        }
        
    }
    
    func repositionBadge(tabIndex: Int){

        for badgeView in self.tabBar.subviews[tabIndex].subviews {

            if NSStringFromClass(badgeView.classForCoder) == "_UIBadgeView" {
                badgeView.layer.transform = CATransform3DIdentity
                badgeView.layer.transform = CATransform3DMakeTranslation(25, -5, 1.0)
            }
        }
    }

    
    func updateVCTabBarDot(vcIndex:Int){
    
        guard let viewController = viewControllers?[vcIndex] else {
            return
        }
        viewController.tabBarItem.badgeValue = "●"
        viewController.tabBarItem.badgeColor = .clear
        viewController.tabBarItem.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1)], for: .normal)
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            self.repositionBadge(tabIndex: vcIndex)
//        }
//        let tabBarItemBadgeView = tabBar.badgeViewForItem(at: vcIndex)
//        tabBarItemBadgeView?.backgroundColor = #colorLiteral(red: 0.9707236886, green: 0.742860198, blue: 0.8405991197, alpha: 1)
//        tabBarItemBadgeView?.layer.transform = CATransform3DIdentity
//        var offset:Float = 3
//        if vcIndex == 0{
//            offset = 20
//        }
//        if vcIndex == 2{
//            offset = 30
//        }
//        if vcIndex == 3{
//            offset = 3.7
//        }
//        print("\((tabBarItemBadgeView?.bounds.width ?? 0)/2+CGFloat(offset))")
//        tabBarItemBadgeView?.layer.transform = CATransform3DMakeTranslation((tabBarItemBadgeView?.frame.size.width ?? 0)/2, -15, 1.0)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
 
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        guard let myTabBar = tabBar as? CustomizedTabBar else{return}
//          if (myTabBar.items?[3] == item) {
//              myTabBar.arc = false
//          } else {
//              myTabBar.arc = true
//          }
        
        if let tabBar = self.tabBar as? AppTabBar{
            
            guard let items = tabBar.items, let vcIndex = items.firstIndex(of: item) else {return}
            tabBar.selectedIndex = vcIndex
//            tabBar.setNeedsDisplay()
        }
      }
    
    @objc func redirectToSideMenu() {
        let sideMenuVC = SideMenuVC()
        redirect(to: sideMenuVC)
        
        
//        SideMenuVC.orderDetailsViewModel.selectedMeal.value = tuple.selectedMeal
//        orderDetailsVC.orderDetailsViewModel.selectedMealValueDidChanged = tuple.didTapped
//        self.tabBarController?.pushViewController(VC:sideMenuVC)
    }
    
    func redirect(to willPresentVC:UIViewController,  rowIndex : Int = 0) {
        
//            let sideMenuVC = SideMenuVC()
            willPresentVC.modalPresentationStyle = .overFullScreen
            willPresentVC.modalTransitionStyle = .crossDissolve
        var subVC = UIViewController()
        
        switch rowIndex {
        case 0:
            subVC = AboutUsVc()
        default:
            break
        }
        
        switch willPresentVC {
        case let vc as SideMenuVC:
            vc.redirectToAboutUsVC = {vc.dismissVC()
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                self.redirect(to: subVC)
            }}
        case let vc as AboutUsVc:
            vc.redirectToSideMenuVC = {vc.dismissVC()
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                self.redirect(to: SideMenuVC())
            }}
        default:
            break
        }
        self.present(willPresentVC, animated: true, completion: nil)
    }
}
