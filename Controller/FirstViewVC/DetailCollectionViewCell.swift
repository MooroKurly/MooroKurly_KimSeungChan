//
//  DetailCollectionViewCell.swift
//  marketKurly
//
//  Created by 김승찬 on 2021/05/14.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib{
        return UINib(nibName: "DetailCollectionViewCell", bundle: nil)
    }
}
