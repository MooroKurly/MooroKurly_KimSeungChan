//
//  FirstCollectionViewCell.swift
//  marketKurly
//
//  Created by 김승찬 on 2021/05/13.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var firstLabel: UILabel!
    // override init (style: UICollectionViewCell.CellStyle,reuseidentifier: String?) {
     //   super.init(style: style,reuseidentifier: reuseidentifier)
       // firstLabel.textColor = .lightGray
   // }
    override func awakeFromNib() {
        super.awakeFromNib()
           // Initialization code
        firstLabel.textColor = .lightGray
       }

    override var isHighlighted: Bool{
        didSet{
            firstLabel.textColor = isHighlighted ? .mainPurple : .lightGray
            }
        }
        
        override var isSelected: Bool{
            didSet{
                firstLabel.textColor = isSelected ? .mainPurple : .lightGray
            }
        }
        
       static func nib() -> UINib{
            return UINib(nibName: "FirstCollectionViewCell", bundle: nil)
        }

    

}
