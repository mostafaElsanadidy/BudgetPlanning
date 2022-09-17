//
//  OrderDetailsVC.swift
//  CheeseBurgerApp
//
//  Created by mostafa elsanadidy on 17.08.22.
//

import UIKit

class OrderDetailsVC: UIViewController {

    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
 //   var tag = 110
    var mainViews:[UIView] = []
    var currentIndex = 0
    var mainBttns:[UIButton] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let viewsTag:[Int] = [100,110]
        for tag in viewsTag{
            if let view = self.view.viewWithTag(tag){
                mainViews.append(view)}
            if let bttn = self.view.viewWithTag(tag+100) as? UIButton{
                mainBttns.append(bttn)}
        }
        animatedView.bringSubviewToFront(mainViews[0])
        view.bringSubviewToFront(stackView)
        if let bttn1 = self.view.viewWithTag(200) as? UIButton{
          //  view.bringSubviewToFront(bttn1)
            bttn1.addTarget(self, action: #selector(didTimeOut(sender:)), for: .touchUpInside)
        }
//        if let bttn2 = self.view.viewWithTag(210) as? UIButton{
//            bttn2.addTarget(self, action: #selector(didTimeOut(sender:)), for: .touchUpInside)
//        }
    }

    @objc func didTimeOut(sender:UIButton) {

        let isLastIndex = (currentIndex == mainViews.count-1)
        let nextIndex = isLastIndex ? 0 : currentIndex+1
        print(currentIndex,nextIndex)
        
        
                UIView.transition(with: animatedView, duration: 0.8, options: .transitionFlipFromTop, animations: {
        
                    self.mainViews[self.currentIndex].isHidden = true
                    self.mainViews[nextIndex].isHidden = false
                    self.mainBttns[1].isHidden = !self.mainBttns[1].isHidden
                    }, completion: {_ in
                        self.currentIndex = nextIndex
                    })
        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
