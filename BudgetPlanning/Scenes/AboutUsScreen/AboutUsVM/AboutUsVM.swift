//
//  AboutUsVM.swift
//  Zawidha
//
//  Created by Mostafa on 12/13/20.
//

import Foundation

protocol AboutUs_VM_PR {
    
    func showActivityView(isShow:Bool, tag:Int)
 //   func showAlert(alertBody:String,alertType:Alert_Type,alertStatus:Alert_Status,currentRank:Int,completion: ((Bool)->())?)
    //func changeCountries(countries:[Country])
//    func changeAboutUsApp(AboutUs_M:AboutUs_M?,socialLinks:SocialLink)
   // func add_another_udid(with password:String,udid:String)
}

class AboutUs_VM {
    
    public var terms_conditions : String!
    public var title : String!
    var delegate : AboutUs_VM_PR?
    
    //MARK: - getTermsConditions
//     func getUserTermsConditions(){
//        self.delegate?.showActivityView(isShow: true, tag: 1000)
//        APIClient.getAboutUsApp(completionHandler: { [weak self]
//            RootAboutUs_M in
//
//                guard let strongSelf = self else{
//                    return
//                }
//
//             guard let RootAboutUs_M = RootAboutUs_M else{
//                strongSelf.delegate?.showActivityView(isShow: false, tag: 1000)
//                 return
//             }
//             DispatchQueue.main.async{
//                strongSelf.delegate?.showActivityView(isShow: false, tag: 1000)
//                strongSelf.delegate?.changeAboutUsApp(AboutUs_M: RootAboutUs_M.about, socialLinks: RootAboutUs_M.socialLinks)
//            //    strongSelf.delegate?.changeTerms_Conditions(terms_conditions: RootAboutUs_M.data)
//
//                     }
//            }, completionFaliure: {
//                error in
//             //   self.killLoading()
//                self.delegate?.showActivityView(isShow: false, tag: 1000)
//                print(error!.localizedDescription)
//
//            })
//        }
}
