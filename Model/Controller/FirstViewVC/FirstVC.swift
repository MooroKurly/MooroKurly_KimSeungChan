//
//  FirstVC.swift
//  marketKurly
//
//  Created by 김승찬 on 2021/05/14.
//

import UIKit

//혹시 여기에 나오는 : BaseViewController 궁금하면 다음 코드에 넣어놨어!
class FirstVC: BaseViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    
//이게 홈화면에 들어있는 그 5개 뷰 뷰컨 따로따로 만든거
    let homeViews : [BaseViewController] = [CurlyRecVC(), NewViewVC(), BestVC(), ShoppingVC(), BenefitVC()]
    
      //  func addNavBarImage() {

//이건 내가 그냥 상단에 로고 넣을때 작성한 코드라 사실 피료 없음 ㅋㅋ
       // let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 60))
        //imageView.contentMode = .scaleAspectFit

     ///   let image = UIImage(named: "홈로고")
      //  imageView.image = image////

       // navigationItem.titleView = imageView
 //   }
    
    func scrollToMenuIndex(menuIdx: Int){
        let indexPath = NSIndexPath(item: menuIdx, section: 0)
        collectionView.isPagingEnabled = false4        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
        collectionView.isPagingEnabled = true
    }
    
        lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.FirstVC = self
        return mb
    }()
    
    private func setUpMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMenuBar()
        //addNavBarImage()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.register(DetailCollectionViewCell.nib(), forCellWithReuseIdentifier: "DetailCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
    }
}

extension FirstVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 5
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        //여기서 그 홈화면에 5개 뷰있는거 다 따로따로 만들어서 넣어주면 대
                self.addChild(homeViews[indexPath.item])
        cell.addSubview(homeViews[indexPath.item].view)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}


