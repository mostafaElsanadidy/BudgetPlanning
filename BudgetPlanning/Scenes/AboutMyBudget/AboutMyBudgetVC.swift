//
//  FirstViewController.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 08.08.22.
//

import UIKit

class AboutMyBudgetVC: UIViewController {

    @IBOutlet weak var precentagesCollectionView: SelfSizingCollectionView!
    @IBOutlet weak var detailsBttn: UIButton!
    @IBOutlet weak var circularProgress: CircularProgressView!
    var selectedIndex = 1
    var endIndex = 0
   
    var gapSize = 0.03
    
    var arrOfValues : [(fromValue:CGFloat,value:CGFloat,endIndex:Int)] = []
//    {
//        didSet{
//            circularProgress.progressColor = condition ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4043720574)
//            circularProgress.trackColor = UIColor.clear
//            circularProgress.flag = condition ? 0.5 : 1.5
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
//    var precentages = [0.3,0.7]
//    var colors:[UIColor] = [.red , .white]
    var condition = true
//    var precentages = [0.7,0.3]
//    var colors:[UIColor] = [.red,.blue]
    
    var precentages = [0.2,0.3,0.1,0.22,0.18]
    var colors:[UIColor] = [.red, .blue , .brown , .lightGray, .cyan]
    var categories = ["Food","medecine","babbyToys","transportation","others"]
    
    var timer : Timer? = nil {
            willSet {
                timer?.invalidate()
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Do any additional setup after loading the view.
        setup_Collection()
        arrOfValues = [(fromValue:CGFloat,value:CGFloat,endIndex:Int)](repeating: (fromValue:CGFloat(0.0),value:CGFloat(0.0),endIndex:0), count: precentages.count)
        condition = (self.savedBarDirection == .clockwise)
//        endIndex = condition ? 0 : precentages.count - 1
        endIndex = 0
        configureCircularProgressBar()
        
    }
    
    private func setup_Collection() {
        precentagesCollectionView.delegate = self
        precentagesCollectionView.dataSource = self
        precentagesCollectionView.register(UINib(nibName: "PrecentageCell", bundle: nil), forCellWithReuseIdentifier: "PrecentageCell")}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        startTimer()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if let tabBar = self.tabBarController?.tabBar{
            
            guard let items = tabBar.items, let vcIndex = items.firstIndex(of: tabBarItem) else {return}
            print(vcIndex)
            self.selectedIndex = vcIndex
//            tabBar.setNeedsDisplay()
        }
        
        
//        let selectedIndex = 0
        tabBarItem.title = ""
//        setup_Collection()
        tabBarItem.image = configureTabBarImage(with: selectedIndex,isSelectedState: true)
        tabBarItem.selectedImage = configureTabBarImage(with: selectedIndex)
        tabBarController?.selectedIndex = selectedIndex
//        startTimer()
        
//        precentagesCollectionView.reloadData()
//        view.viewWithTag(100)?.isHidden = true
        precentagesCollectionView.isHidden = false
        detailsBttn.layer.cornerRadius = 10
//        configureCircularProgressBar()
       
    }
 
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        stopTimer()
//        self.gapSize += 0.01
        print("mkmklmlk \(self.gapSize)")

    }
    
    
    func startTimer() {
        stopTimer()
        guard self.timer == nil else { return }
        createArrOfValues()
        
        didTimeOut()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.didTimeOut), userInfo: nil, repeats: true)
    }
//    0.03999998509883881 0.19999998807907104 0
//    0.9399999985098839, 1.0, 4.0
    
//    0.0, 0.16000000298023223, 0.0
//    0.9000000134110451 0.9600000149011612 4
    func stopTimer() {
        guard timer != nil else { return }
//        endIndex = condition ? 0 : precentages.count - 1
        endIndex = 0
        currentValue = condition ? 0.0 : 1.0
        timer?.invalidate()
        timer = nil
    }
    
    @objc func didTimeOut() {
//        print(index)
//      let valueIndexCondition:Bool = valueIndex <= precentages.count-1
        
//        let endRangeCondition:Bool = condition ? (endIndex <= precentages.count-1) : (endIndex >= 0)
        print(endIndex)
        guard endIndex <= arrOfValues.count-1 else{
            
//            view.viewWithTag(100)?.isHidden = false
            
//            precentagesCollectionView.reloadData()
            precentagesCollectionView.isHidden = false
            stopTimer()
//            timer?.invalidate()
            
            return
        }
        print(endIndex)
//        let strokeStart:CGFloat = currentValue
//        let strokeEnd:CGFloat = condition ? strokeStart + CGFloat(Float(precentages[endIndex])) - gapSize : strokeStart - CGFloat(Float(precentages[endIndex])) + gapSize
//        currentValue = condition ? strokeEnd + gapSize : strokeEnd - gapSize
////        let strokeEnd:CGFloat = strokeStart + CGFloat(Float(precentages[endIndex])) - gapSize
////                currentValue = strokeEnd + gapSize
////            let start:Float = (360 * 0.125) / 360 * Float(endIndex)
////        let end:Float = start + ((360 * 0.125) / 360) - 0.1
////            if self.isBeingDismissed{
////                break
////            }
////        let fromValue = strokeStart
////        let value = strokeEnd
//
//        let fromValue = condition ? strokeStart :strokeEnd
//        let value = condition ? strokeEnd : strokeStart
        
        print(arrOfValues[endIndex].fromValue,arrOfValues[endIndex].value,arrOfValues[endIndex].endIndex)
        print(endIndex)
        circularProgress.setProgressWithAnimation(fromValue: Float(arrOfValues[endIndex].fromValue), duration: 1.0, value: Float(arrOfValues[endIndex].value),color: colors[arrOfValues[endIndex].endIndex])
//                print(endIndex)
        
//        if endIndex == self.precentages.count - 1{
//            self.gapSize += 0.01
//            print("mkmklmlk \(self.gapSize)")
//        }
//        if endIndex == 0{
//            self.gapSize += 0.01
//            print("mkmklmlk \(self.gapSize)")
//        }
        endIndex += 1
//        endIndex = condition ? endIndex + 1 : endIndex - 1
    }
    
    func configureCircularProgressBar() {
        currentValue = condition ? 0.0 : 1.0
        circularProgress.progressColor = condition ? .white : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4043720574)
        circularProgress.precentages = precentages
        circularProgress.colors = colors
        circularProgress.trackColor = UIColor.clear
        circularProgress.isClockWise = condition ? true : false
//        circularProgress.flag = condition ? 0.5 : 2.5
        circularProgress.isSegmented = true
        circularProgress.progress = 1
        
//        configureProgressBar(progressBar: circularProgress, savedBarDirection: savedBarDirection)
        startTimer()
    }
    
    
    
    //MARK: - createArrOfValues
    func createArrOfValues() {
//        let endRangeCondition:Bool = condition ? (endIndex <= precentages.count-1) : (endIndex >= 0)
        
        let range = condition ? stride(from: 0, through: precentages.count - 1, by: 1) : stride(from: precentages.count - 1, through: 0, by: -1)
        for i in range {
            let strokeStart:CGFloat = currentValue
            let strokeEnd:CGFloat = condition ? strokeStart + CGFloat(Float(precentages[i])) - gapSize : strokeStart - CGFloat(Float(precentages[i])) + gapSize
            currentValue = condition ? strokeEnd + gapSize : strokeEnd - gapSize
            let fromValue = condition ? strokeStart :strokeEnd
            let value = condition ? strokeEnd : strokeStart
            arrOfValues[i] = (fromValue:fromValue,value:value,endIndex:i)
        }
       
        print(arrOfValues)
       
        
    }
}







//   func configureProgressBar(progressBar:CircularProgressView,savedBarDirection:SavedBarDirection){
//       let duration = 1.0
//      
////        progressBar.setProgressWithAnimation(fromValue: 0, duration: duration, value: 0)
//       var currentValue = 0.0
//       for i in 0 ... precentages.count - 1 {
////            let start:Float = (360 * 0.125) / 360 * Float(i)
////            let end:Float = start + ((360 * 0.125) / 360) - 0.008
//           
//           let strokeStart:CGFloat = currentValue
//           let strokeEnd:CGFloat = strokeStart + CGFloat(Float(precentages[i])) - gapSize
//           currentValue = strokeEnd + gapSize
//           
////            let start:Float = i == 0 ? 0.0 : Float(precentages[i-1])
////            let end:Float = start + Float(precentages[i]) - 0.008
//
////             deadline = .now()+Double(i)
////            if self.isBeingDismissed{
////                deadline = .now()+0.001
////            }
//           DispatchQueue.main.asyncAfter(deadline: .now()){
//
//       //        progressBar.setProgressWithAnimation(fromValue: Float(strokeStart), duration: duration, value: Float(strokeEnd),color: self.colors[i])
//               print(i)
//               if i == self.precentages.count - 1{
//                   self.gapSize += 0.01
//           //        print("mkmklmlk \(self.gapSize)")
//               }
//           }
//       }
//       
//           let leftLabelViewTag = condition ? 101 : 100
//       if let view = view.viewWithTag(leftLabelViewTag){
//           DispatchQueue.main.asyncAfter(deadline: .now()+duration){
//               view.isHidden = false}
//       }
//      
//   }
