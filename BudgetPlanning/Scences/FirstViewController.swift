//
//  FirstViewController.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 08.08.22.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var circularProgress: CircularProgressView!
    let selectedIndex = 1
    var index = 0
    var gapSize = 0.04
//    {
//        didSet{
//            circularProgress.progressColor = savedBarDirection == .clockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4043720574)
//            circularProgress.trackColor = UIColor.clear
//            circularProgress.flag = .clockwise == savedBarDirection ? 0.5 : 1.5
//            circularProgress.isSegmented = true
//            circularProgress.progress = 1
//    //        configureProgressBar(progressBar: circularProgress, savedBarDirection: savedBarDirection)
//            startTimer()
//
//        }
//    }
    var currentValue = 0.0
    let savedBarDirection : SavedBarDirection = .clockwise
//    var deadline:DispatchTime?
//    var precentages = [0.5,0.1,0.2,0.2]
//    var colors:[UIColor] = [.red, .blue , .brown , .white]
    
    var precentages = [0.2,0.4,0.1,0.2,0.1]
    var colors:[UIColor] = [.red, .blue , .brown , .white, .cyan]
    var timer : Timer? = nil {
            willSet {
                timer?.invalidate()
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Do any additional setup after loading the view.

//        circularProgress.progressColor = savedBarDirection == .clockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4043720574)
//        circularProgress.trackColor = UIColor.clear
//        circularProgress.flag = .clockwise == savedBarDirection ? 0.5 : 1.5
//        circularProgress.isSegmented = true
//        circularProgress.progress = 1
////        configureProgressBar(progressBar: circularProgress, savedBarDirection: savedBarDirection)
//        startTimer()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        startTimer()
        
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
//        startTimer()
        circularProgress.progressColor = savedBarDirection == .clockwise ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4043720574)
        circularProgress.trackColor = UIColor.clear
        circularProgress.flag = .clockwise == savedBarDirection ? 0.5 : 1.5
        circularProgress.isSegmented = true
        circularProgress.progress = 1
//        configureProgressBar(progressBar: circularProgress, savedBarDirection: savedBarDirection)
        startTimer()
       
    }
 
    func configureProgressBar(progressBar:CircularProgressView,savedBarDirection:SavedBarDirection){
        let duration = 1.0
       
//        progressBar.setProgressWithAnimation(fromValue: 0, duration: duration, value: 0)
        var currentValue = 0.0
        for i in 0 ... precentages.count - 1 {
//            let start:Float = (360 * 0.125) / 360 * Float(i)
//            let end:Float = start + ((360 * 0.125) / 360) - 0.008
            
            let strokeStart:CGFloat = currentValue
            let strokeEnd:CGFloat = strokeStart + CGFloat(Float(precentages[i])) - gapSize
            currentValue = strokeEnd + gapSize
            
//            let start:Float = i == 0 ? 0.0 : Float(precentages[i-1])
//            let end:Float = start + Float(precentages[i]) - 0.008

//             deadline = .now()+Double(i)
//            if self.isBeingDismissed{
//                deadline = .now()+0.001
//            }
            DispatchQueue.main.asyncAfter(deadline: .now()){

        //        progressBar.setProgressWithAnimation(fromValue: Float(strokeStart), duration: duration, value: Float(strokeEnd),color: self.colors[i])
                print(i)
                if i == self.precentages.count - 1{
                    self.gapSize += 0.01
            //        print("mkmklmlk \(self.gapSize)")
                }
            }
        }
        
            let leftLabelViewTag = savedBarDirection == .clockwise ? 101 : 100
        if let view = view.viewWithTag(leftLabelViewTag){
            DispatchQueue.main.asyncAfter(deadline: .now()+duration){
                view.isHidden = false}
        }
       
    }
 
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        stopTimer()
        self.gapSize += 0.01
        print("mkmklmlk \(self.gapSize)")

    }
    
    
    func startTimer() {
        stopTimer()
//        index = 0
        guard self.timer == nil else { return }
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.didTimeOut), userInfo: nil, repeats: true)
    }

    func stopTimer() {
        guard timer != nil else { return }
        index = 0
        currentValue = 0.0
        timer?.invalidate()
        timer = nil
    }
    
    @objc func didTimeOut() {
//        print(index)
        guard index <= precentages.count-1 else{
            
//            index = 0
            stopTimer()
//            timer?.invalidate()
            
            return
        }
        
        
        
        
        let strokeStart:CGFloat = currentValue
        let strokeEnd:CGFloat = strokeStart + CGFloat(Float(precentages[index])) - gapSize
        currentValue = strokeEnd + gapSize
//            let start:Float = (360 * 0.125) / 360 * Float(index)
//        let end:Float = start + ((360 * 0.125) / 360) - 0.1
//            if self.isBeingDismissed{
//                break
//            }
        
               
        circularProgress.setProgressWithAnimation(fromValue: Float(strokeStart), duration: 1.0, value: Float(strokeEnd),color: self.colors[index])
                print(index)
        
//        if index == self.precentages.count - 1{
//            self.gapSize += 0.01
//            print("mkmklmlk \(self.gapSize)")
//        }
//        if index == 0{
//            self.gapSize += 0.01
//            print("mkmklmlk \(self.gapSize)")
//        }
        index += 1
    }
}

