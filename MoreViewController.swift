//
//  MoreViewController.swift
//  قطر ٢٠٢٠
//
//  Created by Asoom Al-marrikhi on 12/8/16.
//  Copyright © 2016 Asma Al-marrikhi. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
        let colory = UIColor(red: 86/225.0, green: 4/225.0, blue: 44/225.0, alpha: 0.90)
        var array :[String]
    
        init(array :[String]){
            self.array = array
            super.init(nibName:nil, bundle:nil)
        }
    
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
    
    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        flowLayout.itemSize = CGSize(width: 300, height: 50)
        flowLayout.sectionInset = UIEdgeInsets(top:60, left: 15, bottom: 15, right: 15)
        flowLayout.minimumLineSpacing = 60
  
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MoreCell")
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
   
        
        return collectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
                // collectionView layout
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
   }


extension MoreViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCell", for: indexPath)
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        
        let label = UILabel(frame: cell.contentView.bounds)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .clear
        
          cell.contentView.addSubview(label)
        
    
        
        let  text = array[indexPath.row] as String
        label.text = text
       label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        
        
               cell.backgroundColor = colory
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        return cell
    }
    
    
}
