//
//  SpeedoMeterVC.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 02.10.22.
//

import UIKit

class SpeedoMeterVC: UIViewController{
    private let speedometerView = SpeedometerView(frame: .zero, maxSpeed: 200)

    override func viewDidLoad() {
        super.viewDidLoad()
//        36B0FF
//        view.addSubview(speedometerView)

        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            self.speedometerView.startAccelerating()
            self.speedometerView.setSpeed(CGFloat(arc4random_uniform(100)) / 100 * 140)
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(800)) {
                self.speedometerView.endAccelerating()
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        speedometerView.frame.size = CGSize(width: 300, height: 300)
        speedometerView.center = view.center
    }
}
