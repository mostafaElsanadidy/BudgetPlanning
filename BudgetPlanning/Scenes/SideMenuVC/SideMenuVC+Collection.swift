//
//  SideMenuVC+Collection.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 30.09.22.
//

import Foundation
import UIKit

extension SideMenuVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SideMenuCell", for: indexPath) as? SideMenuCell else{return UICollectionViewCell()}
        if let cell = cell as? SideMenuCell{
//            if indexPath.row == 1 && indexPath.section == 0{
//                cell.visualEffectView.isHidden = false
//            }
        }
//        if let viewx = cell.viewWithTag(130){
//            viewx.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
//            cell.setNeedsDisplay()
//            //view.bringSubviewToFront(viewx)
//        }
        return cell
    }
    
    
    
}
