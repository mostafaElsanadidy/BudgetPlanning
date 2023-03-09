//
//  MonthGoalVC+DataSource.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 18.09.22.
//

import Foundation
import UIKit
extension MonthGoalVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 200 {
            return days.count
        }else{
            return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var identifier = ""
        if collectionView.tag == 200 {
            identifier = "DayNumCell"
        }else{
            identifier = "PaymentsCell"
        }
           
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        if let cell = cell as? DayNumCell{
            cell.dayNameLabel.text = days[indexPath.row]
        }
        if let cell = cell as? PaymentsCell{
            cell.paymentImagesView.image = UIImage.init(named: images[indexPath.row%images.count])
        }
               // as? FuturePurchasesCell else{return UICollectionViewCell()}
//        if let viewx = cell.viewWithTag(130){
//            viewx.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
//            cell.setNeedsDisplay()
//            //view.bringSubviewToFront(viewx)
//        }
        return cell
    }
    
    
    
}
