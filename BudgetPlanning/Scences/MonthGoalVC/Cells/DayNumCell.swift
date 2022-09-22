//
//  DayNumCell.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 18.09.22.
//

import UIKit

class DayNumCell: UICollectionViewCell {

    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var segmentedView: UIViewX!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override var isSelected: Bool{
        didSet{
            self.contentView.bringSubviewToFront(self.dayNameLabel)
            toggleIsHighlighted(isSelected: isSelected)
        }
    }
//    override var isHighlighted: Bool {
//           didSet {
//               toggleIsHighlighted()
//           }
//       }

    func toggleIsHighlighted(isSelected:Bool) {
           
        UIView.transition(with: self.contentView, duration: 0.5, options: [.transitionCrossDissolve], animations: {
               self.segmentedView.isHidden = !isSelected
            self.dayNameLabel.textColor = isSelected ? #colorLiteral(red: 1, green: 0.4480487704, blue: 0.3932376504, alpha: 1) : #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
               }, completion: {_ in
               })
       }
}
