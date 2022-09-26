//
//  HomeVC+Collection.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 10.08.22.
//

import Foundation
import UIKit

extension HomeVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FuturePurchasesCell", for: indexPath) as? FuturePurchasesCell else{return UICollectionViewCell()}
//        if let viewx = cell.viewWithTag(130){
//            viewx.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
//            cell.setNeedsDisplay()
//            //view.bringSubviewToFront(viewx)
//        }
        return cell
    }
    
    
    
}
