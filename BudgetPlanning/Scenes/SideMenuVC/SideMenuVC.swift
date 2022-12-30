//
//  SideMenuVC.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 30.09.22.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var sideMenuCollection: SelfSizingCollectionView!
    
    var redirectToAboutUsVC:()->() = {}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup_Style()
        setup_Collection()
        
    //    updateDueDateLabel()
        //animateIN(animation: )
    }
       
       // MARK: - ViewWillAppear
       override func viewWillAppear(_ animated: Bool) {
           self.animateIN(animation: {[weak self] in
            self?.bodyView.transform = .identity
                           })
       }
       
        
       // MARK: - Style
         private func setup_Style() {
            
             
                set_Blur(containerView: containerView)
           //     bodyView.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
                bodyView.layer.cornerRadius = 15
             let image = #imageLiteral(resourceName: "plus-1").withTintColor(.white, renderingMode: .alwaysTemplate)
            
             dismissBtn.setImage(image, for: .normal)
                dismissBtn.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                bodyView.transform = CGAffineTransform(translationX: 0, y: -800)
             
            }


    private func setup_Collection() {
        sideMenuCollection.delegate = self
        sideMenuCollection.dataSource = self
        sideMenuCollection.register(UINib(nibName: "SideMenuCell", bundle: nil), forCellWithReuseIdentifier: "SideMenuCell")}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dismissVC(_ sender: UIButton) {
        dismissVC(with: sender.tag)
    }
    
}


extension SideMenuVC{

// MARK: - Dismiss View
func dismissVC(with bttnTag: Int = 0) {
//    if bttnTag == 2{
//        delegate?.changeDateOfBirthday(with: outputDateOfBirthday, displayFormatDate: dueDateLabel.text!)
//        delegate?.changedate0fBirthTextFieldProgressBar()
//    }
    
    animateOut(animation: {[weak self] in
                          self?.bodyView.transform = CGAffineTransform(translationX: 0, y: -800)
                      }, completion: {[weak self] (_) in
                                  self?.dismiss(animated: false, completion: nil)
                              })
}

    

}

