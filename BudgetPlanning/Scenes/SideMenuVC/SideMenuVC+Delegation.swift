//
//  SideMenuVC+Delegation.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 30.09.22.
//

import Foundation
import UIKit

extension SideMenuVC:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    
    var numberOfItemsInRow,edgeInset:CGFloat
    var heightPerItem:CGFloat = 0
    
    
    heightPerItem = 50
        edgeInset = 10
        numberOfItemsInRow = 1
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
    
          return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
  }


  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
  }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
               return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        redirectToAboutUsVC()
        
    }
}
