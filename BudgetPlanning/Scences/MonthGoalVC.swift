//
//  MonthGoalVC.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 16.09.22.
//

import UIKit

class MonthGoalVC: UIViewController {

    @IBOutlet weak var CircularProgress: CircularProgressView!
    @IBOutlet weak var progressBarII: CircularProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        let selectedIndex = 2
             tabBarItem.title = ""
     //        setup_Collection()
            tabBarItem.image = configureTabBarImage(with: selectedIndex,isSelectedState: true)
            tabBarItem.selectedImage = configureTabBarImage(with: selectedIndex)
            tabBarController?.selectedIndex = selectedIndex
        
        let savedBarDirection : SavedBarDirection = .counterclockwise
        
        CircularProgress.progressColor = savedBarDirection == .clockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2038452957)
        progressBarII.progressColor = savedBarDirection == .counterclockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2038452957)
        
        configureProgressBar(progressBar: CircularProgress, savedBarDirection: savedBarDirection)
        configureProgressBar(progressBar: progressBarII, savedBarDirection: savedBarDirection)
        
    }

    func configureProgressBar(progressBar:CircularProgressView,savedBarDirection:SavedBarDirection){
        progressBar.trackColor = UIColor.clear
        progressBar.flag = .clockwise == savedBarDirection ? 0.5 : 1.5
        progressBar.progress = 0.75
        progressBar.setProgressWithAnimation(fromValue: 0, duration: 1.0, value: 1)
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
