//
//  FirstVCViewController.swift
//  marketKurly
//
//  Created by 김승찬 on 2021/05/13.
//

import UIKit

class FirstVCViewController: UIViewController {

    @IBOutlet weak var FirstVCCollectionView: UICollectionView!
        override func viewDidLoad() {
        super.viewDidLoad()
            
            FirstVCCollectionView.delegate = self
            FirstVCCollectionView.dataSource = self

    
    }
       
}

extension First
