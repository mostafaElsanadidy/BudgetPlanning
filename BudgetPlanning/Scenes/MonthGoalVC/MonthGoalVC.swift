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
    @IBOutlet weak var PaymentsCollection: UICollectionView!
    @IBOutlet weak var optionCollection: UICollectionView!
    @IBOutlet weak var todayGoalProgressBar: SecondProgressBar!
    
    let savedBarDirection : SavedBarDirection = .counterclockwise
    var numOfDays:Int = 0
    var monthName:String = ""
    var selectedIndex = 0
    var days:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup_Collection()
        numOfDays = 30
        monthName = "Dec"
        for i in 1...numOfDays{
            days.append("\(i) \(monthName)")
        }
        todayGoalProgressBar.progress = CGFloat(0.6)
        todayGoalProgressBar.precentageLabel.text = "Saved Today %\((0.6)*100)"
        todayGoalProgressBar.precentageLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        todayGoalProgressBar.precentageLabel.font = UIFont.systemFont(ofSize: 12, weight: .black)
        todayGoalProgressBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3977657091)
        todayGoalProgressBar.color = .white
//        let date = Date().
//        let savedBarDirection : SavedBarDirection = .counterclockwise
//
//        CircularProgress.progressColor = savedBarDirection == .clockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2038452957)
//        progressBarII.progressColor = savedBarDirection == .counterclockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2038452957)
//
//        configureProgressBar(progressBar: CircularProgress, savedBarDirection: savedBarDirection)
//        configureProgressBar(progressBar: progressBarII, savedBarDirection: savedBarDirection)
      
    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//
////        let selectedIndex = 2
////             tabBarItem.title = ""
////     //        setup_Collection()
////            tabBarItem.image = configureTabBarImage(with: selectedIndex,isSelectedState: true)
////            tabBarItem.selectedImage = configureTabBarImage(with: selectedIndex)
////            tabBarController?.selectedIndex = selectedIndex
//
//        let savedBarDirection : SavedBarDirection = .counterclockwise
//
//        CircularProgress.progressColor = savedBarDirection == .clockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2038452957)
//        progressBarII.progressColor = savedBarDirection == .counterclockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2038452957)
//
//        configureProgressBar(progressBar: CircularProgress, savedBarDirection: savedBarDirection)
//        configureProgressBar(progressBar: progressBarII, savedBarDirection: savedBarDirection)
//
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if let tabBar = self.tabBarController?.tabBar{
            
            guard let items = tabBar.items, let vcIndex = items.firstIndex(of: tabBarItem) else {return}
            print(vcIndex)
            selectedIndex = vcIndex
//            tabBar.selectedIndex = vcIndex
//            tabBar.setNeedsDisplay()
        }
        
       
             tabBarItem.title = ""
     //        setup_Collection()
            tabBarItem.image = configureTabBarImage(with: selectedIndex,isSelectedState: true)
            tabBarItem.selectedImage = configureTabBarImage(with: selectedIndex)
            tabBarController?.selectedIndex = selectedIndex
        
        view.viewWithTag(100)?.isHidden = true
        view.viewWithTag(101)?.isHidden = true
        
        

        CircularProgress.progressColor = savedBarDirection == .clockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4043720574)
        progressBarII.progressColor = savedBarDirection == .counterclockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3977657091)

        configureProgressBar(progressBar: CircularProgress, savedBarDirection: savedBarDirection)
        configureProgressBar(progressBar: progressBarII, savedBarDirection: savedBarDirection)
        
    }

    private func setup_Collection() {
        PaymentsCollection.delegate = self
        PaymentsCollection.dataSource = self
        PaymentsCollection.register(UINib(nibName: "PaymentsCell", bundle: nil), forCellWithReuseIdentifier: "PaymentsCell")
        
        optionCollection.delegate = self
        optionCollection.dataSource = self
        optionCollection.register(UINib(nibName: "DayNumCell", bundle: nil), forCellWithReuseIdentifier: "DayNumCell")
    }
    
    func configureProgressBar(progressBar:CircularProgressView,savedBarDirection:SavedBarDirection){
        let duration = 1.0
        progressBar.trackColor = UIColor.clear
        progressBar.flag = .clockwise == savedBarDirection ? 0.5 : 1.5
        progressBar.progress = 0.75
        progressBar.setProgressWithAnimation(fromValue: 0, duration: duration, value: 1)
            let leftLabelViewTag = savedBarDirection == .clockwise ? 101 : 100
        if let view = view.viewWithTag(leftLabelViewTag){
            DispatchQueue.main.asyncAfter(deadline: .now()+duration){
                view.isHidden = false}
        }
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
