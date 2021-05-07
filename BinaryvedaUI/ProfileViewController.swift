//
//  ViewController.swift
//  BinaryvedaUI
//
//  Created by User on 03/05/21.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    @IBOutlet weak var artImageCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
             let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                   layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
                  
            self.screenWidth = UIScreen.main.bounds.width
                   layout.itemSize = CGSize(width: (self.screenWidth/2) - 25, height: 160)
                   layout.minimumInteritemSpacing = 5
                   layout.minimumLineSpacing = 5
                   layout.scrollDirection = .vertical
            self.artImageCollectionView.collectionViewLayout = layout
            self.view.layoutIfNeeded()

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        var image = UIImage(named: "group10Copy")
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action: nil)
        
        var image1 = UIImage(named: "group4Copy2")
        image1 = image1?.withRenderingMode(.alwaysOriginal)
        
        let sideMenu = UIBarButtonItem(image: image1,  style: .plain, target: self, action: nil)
        sideMenu.imageInsets = UIEdgeInsets(top: 0.0, left: -15, bottom: 0, right: 0)
    
        
        var image2 = UIImage(named: "copy8")
        image2 = image2?.withRenderingMode(.alwaysOriginal)
        let addButton = UIBarButtonItem(image: image2,  style: .plain, target: self, action: nil)
        addButton.imageInsets = UIEdgeInsets(top: 0.0, left: -15, bottom: 0, right: -15)
        
        var image3 = UIImage(named: "group")
        image3 = image3?.withRenderingMode(.alwaysOriginal)
        let profileButton = UIBarButtonItem(image: image3,  style: .plain, target: self, action: nil)
        profileButton.imageInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0, right: -15)
        
        navigationItem.rightBarButtonItems = [sideMenu, addButton, profileButton]
    }
    
    // MARK: - Displays numberOfItemsInSection according to array count in collectionview.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    // MARK: - Loads collection view cell.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ArtImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtImageCollectionViewCell", for: indexPath) as! ArtImageCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


class ArtImageCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var artImageView: UIImageView!
}
