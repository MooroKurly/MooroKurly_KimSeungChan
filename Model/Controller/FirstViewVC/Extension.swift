//
//  Extension.swift
//  marketKurly
//
//  Created by 김승찬 on 2021/05/14.
//

import Foundation
import UIKit

extension UIView{
    func addConstraintsWithFormat(format: String, views: UIView...)
    {
        var viewsDictionary = [String : UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
