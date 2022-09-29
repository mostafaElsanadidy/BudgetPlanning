//
//  HomeVC.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 09.08.22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeCollection: UICollectionView!
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

