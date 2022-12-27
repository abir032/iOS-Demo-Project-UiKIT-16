//
//  ViewController.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let collectionNib =  UINib(nibName:"ItemCell", bundle: nil)
        collectionView.register(collectionNib, forCellWithReuseIdentifier: "itemCell")
       let insets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
        let itemSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
    
        let item =  NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = insets
        let group1Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        
        let horGroup1 = NSCollectionLayoutGroup.horizontal(layoutSize: group1Size, subitems: [item])
        
        let varGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        let varGroup = NSCollectionLayoutGroup.vertical(layoutSize: varGroupSize, subitems: [horGroup1])
        
        
        
        let itemSize3 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        let item3 = NSCollectionLayoutItem(layoutSize: itemSize3)
        item3.contentInsets = insets
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [varGroup,item3])
        let section  = NSCollectionLayoutSection(group: group)
        let compLayout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = compLayout
    }
}

extension ViewController: UICollectionViewDelegate{
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Images.images.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item =  collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemCell
        item.imageView.image = UIImage(named: Images.images[indexPath.row].image)
        return item
    }
    
    
}
