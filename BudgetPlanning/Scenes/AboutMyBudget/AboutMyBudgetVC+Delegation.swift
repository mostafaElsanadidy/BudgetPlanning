//
//  AboutMyBudgetVC+Delegation.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 24.09.22.
//

import Foundation
import UIKit
extension AboutMyBudgetVC:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        var numberOfItemsInRow,edgeInset:CGFloat
        var heightPerItem:CGFloat = 0

            
            heightPerItem = 35
                edgeInset = 10
                numberOfItemsInRow = 2
        
          //  getFromApiData(recipeHit: arrOfSeparateOrders[indexPath.row])
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){}
    //    if let cell = collectionView.cellForItem(at: indexPath) as? FuturePurchasesCell,let imageView = cell.viewWithTag(130){
    //        imageView.layer.cornerRadius = 20
    //        imageView.backgroundColor = .red
    //    }}
        let paddingSpace = edgeInset*(numberOfItemsInRow+1)
        let availableWidth = collectionView.frame.size.width-paddingSpace
        let widthPerItem = availableWidth/numberOfItemsInRow
        
        return CGSize(width: widthPerItem,height: heightPerItem)
      }



      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          insetForSectionAt section: Int) -> UIEdgeInsets {

              return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
      }


      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
      }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

                   return 10
        }
    }
