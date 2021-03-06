//
//  BarCollectionViewCell.swift
//  marketKurly
//
//  Created by 김승찬 on 2021/05/13.
//

import UIKit

class BarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.textColor = .lightGray
    }
    
    override var isHighlighted: Bool{
        didSet{
            label.textColor = isHighlighted ? .mainPurple : .lightGray
        }
    }
    
    override var isSelected: Bool{
        didSet{
            label.textColor = isSelected ? .mainPurple : .lightGray
        }
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "BarCollectionViewCell", bundle: nil)
    }

}
```
