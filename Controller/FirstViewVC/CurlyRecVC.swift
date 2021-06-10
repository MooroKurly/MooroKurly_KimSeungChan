//
//  CurlyRecVC.swift
//  marketKurly
//
//  Created by 김승찬 on 2021/05/13.
//

import UIKit

class CurlyRecVC: BaseViewController{
    
    let width = UIScreen.main.bounds.width
    let cellwidth : CGFloat = 0
    let cellheight : CGFloat = 0
    
    let CurlyRevCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let CV = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        flowlayout.scrollDirection = .vertical
        return CV
    }()
    
    var appList = [CurlyListDataModel1(mainImageview: "imgBanner"), CurlyListDataModel1(mainImageview: "imgBanner")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var iconImage1 : UIImageView
        iconImage1 = UIImageView(frame: CGRect(x: 151, y: 42, width: 74, height: 44));
        iconImage1.image = UIImage(named: "iconLogo.png")
        self.view.addSubview(iconImage1)
       
        
        CurlyRevCollectionView.dataSource = self
        CurlyRevCollectionView.delegate = self
        
        view.addSubview(CurlyRevCollectionView)
        
        CurlyRevCollectionView.topAnchor.constraint(equalTo: iconImage1.bottomAnchor, constant: 80).isActive = true
        CurlyRevCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        CurlyRevCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        CurlyRevCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        CurlyRevCollectionView.translatesAutoresizingMaskIntoConstraints = false
        CurlyRevCollectionView.register(CurlyRevCell.self, forCellWithReuseIdentifier: "CurlyRevCell")
        CurlyRevCollectionView.reloadData()
      
    }

}

extension CurlyRecVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let CurlyRevCell = collectionView.dequeueReusableCell(withReuseIdentifier: CurlyRevCell.identifier, for: indexPath) as? CurlyRevCell else { return UICollectionViewCell()}
        
        CurlyRevCell.setData1(imageName1: appList[indexPath.row].mainImageview)
        return CurlyRevCell
    }
    
}
extension CurlyRecVC : UICollectionViewDelegate {
}

extension CurlyRecVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellwidth = width + (340 / 375)
        let cellheight = cellwidth * (375 / 340)
        return CGSize(width: cellwidth, height: cellheight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
  }

