//
//  AboutMyBudget+Collection.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 24.09.22.
//

import Foundation
import UIKit
extension AboutMyBudgetVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return colors.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var identifier = ""
            identifier = "PrecentageCell"
           
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        print("ksmdlfmsdlkfmskdlmfdklsmfklsd")
        if let cell = cell as? PrecentageCell{
            cell.precentageLabel.text = "%\(precentages[indexPath.row]*100)"
            cell.categoryLabel.text = categories[indexPath.row]
            cell.progressBar.progress = 1
            cell.progressBar.color = colors[indexPath.row]
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
