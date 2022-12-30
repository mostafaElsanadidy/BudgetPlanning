//
//  HomeVC.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 09.08.22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeCollection: UICollectionView!
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var sideMenuImageView: UIImageView!
    @IBOutlet weak var containerView: UIViewX!
    var selectedIndex = 0
    
    func timeConversion(s: String) -> String {
        // Write your code here
       
    var newString = s
    switch newString{
        case let s where s.contains("PM"):
    let formatStrArr = s.components(separatedBy: "PM")
    print(formatStrArr)
    var timeStrArr = formatStrArr[0].components(separatedBy: ":")
    if var hour = Int(timeStrArr[0]){
     hour = hour+12 == 24 ? hour : hour+12
     timeStrArr[0] = "\(hour)"
    }
    newString = timeStrArr.joined(separator: ":")+"PM"

    case let s where s.contains("AM"):
    let formatStrArr = s.components(separatedBy: "AM")
    print(formatStrArr)
    var timeStrArr = formatStrArr[0].components(separatedBy: ":")
    if var hour = Int(timeStrArr[0]){
     hour = hour-12
     timeStrArr[0] = "\(hour)"
     if hour < 10{
         timeStrArr[0] = "0\(hour)"
     }
    }
    newString = timeStrArr.joined(separator: ":")+"AM"
        default:
        return newString
    }
    return newString
    }

    func pangrams(s: String) -> String {
        // Write your code here
        var isPangram = ""
        
    var alphabets = (97...125).map({Character(UnicodeScalar($0))})
        
     alphabets = (0..<26).map({Character(UnicodeScalar("A".unicodeScalars.first!.value + $0)!)})
        alphabets = (90...97).map({Character(UnicodeScalar($0))})
    print(alphabets,(" ".unicodeScalars.first!.value))
        let arr = [0...8]
    for letter in alphabets{
        print(letter,letter.unicodeScalars.first!.value)
        guard s.lowercased().contains(letter)
        else{
            isPangram = "not pangram"
            break}
            isPangram = "pangram"
    }
    return isPangram
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        let oldString = "Hello, playground"
        let newString = oldString.prefix(4) + "0" + oldString.dropFirst(5)
        print(newString)
        
        var s = "12:01:00PM"
        s = "07:05:45PM"
        s = "12:40:22AM"
        print(timeConversion(s: s))
        print(pangrams(s: "We promptly judged antique ivory buckles for the next prize"))
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        sideMenuView.isUserInteractionEnabled = true
        sideMenuView.addGestureRecognizer(tapGestureRecognizer)
//        containerView.bringSubviewToFront(sideMenuView)
//        sideMenuView.backgroundColor = .lightGray
        }
    
   

    @objc func imageTapped()
    {
        // Your action
        NotificationCenter.default.post(name: Notification.Name(rawValue: "showSideMenu"), object: nil)
    }
    
    
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
        setup_Collection()
        tabBarItem.image = configureTabBarImage(with: selectedIndex,isSelectedState: true)
        tabBarItem.selectedImage = configureTabBarImage(with: selectedIndex)
        tabBarController?.selectedIndex = selectedIndex
        
    }
    
   
    
    // MARK: - Setup Collection
    private func setup_Collection() {
        homeCollection.delegate = self
        homeCollection.dataSource = self
        homeCollection.register(UINib(nibName: "FuturePurchasesCell", bundle: nil), forCellWithReuseIdentifier: "FuturePurchasesCell")
//        let counter1 = countingClosure(start: 80)
//        let counter2 = countingClosure(start: 70)
//        print(counter1(),counter2(),counter1(),counter1(),counter2()) // 1
         // 1
         // 2
         // 3
         // 2
        
        var counter = 0
        let closure = { [counter] in //
            print(counter) }
        counter = 1
        closure()
        
        var john: Student? = Student(firstName: "Johnny", lastName: "Appleseed")
        var jane: Student? = Student(firstName: "Jane", lastName: "Appleseed")
        john?.partner = jane
        jane?.partner = john

    }
    
//    func countingClosure(start:Int) -> (() -> Int) {
//      var counter = 0
//      let incrementCounter: () -> Int = {
//    counter += 1
//        return counter
//      }
//        let clos = incrementCounter
//        clos()
////        print(incrementCounter())
//        counter = start
//      return clos
//    }
}

class Person {
  var firstName: String
  var lastName: String
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

class Student: Person {
  var partner: Student?
deinit {
    print("\(firstName) being deallocated!")
    partner = nil
  }
}

