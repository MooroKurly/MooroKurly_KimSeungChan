//
//  CurlyRevCell.swift
//  marketKurly
//
//  Created by 김승찬 on 2021/05/27.
//

import UIKit

class CurlyRevCell: UICollectionViewCell {
    
    static let identifier = "CurlyRevCell"
    
    var mainImageview = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImageview)
        mainImageview.translatesAutoresizingMaskIntoConstraints = false
        
        mainImageview.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        mainImageview.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        mainImageview.rightAnchor.constraint(equalTo: rightAnchor,constant: 0).isActive = true
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData1(imageName1: String) {
        if let image = UIImage(named: imageName1) {
        mainImageview.image = image
    }
    
    }
}


