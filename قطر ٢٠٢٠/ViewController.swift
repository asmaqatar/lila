//
//  ViewController.swift
//  قطر ٢٠٢٠
//
//  Created by Asoom Al-marrikhi on 12/7/16.
//  Copyright © 2016 Asma Al-marrikhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let colory = UIColor(red: 86/225.0, green: 4/225.0, blue: 44/225.0, alpha: 0.90)
    
    let imageArray = [#imageLiteral(resourceName: "transport") , #imageLiteral(resourceName: "tickets") , #imageLiteral(resourceName: "restorant") , #imageLiteral(resourceName: "friends") , #imageLiteral(resourceName: "building") , #imageLiteral(resourceName: "cafe") , #imageLiteral(resourceName: "health"), #imageLiteral(resourceName: "health")]
    
    let sectionArray = [
        
        ["name": "مواصلاتي" ,
         "more":["تاكسي","باصات"]],
      
     ["name" : "تذاكر" ,
      "more": ["جدول المباريات","احجز تذكرتك"]],
   
     ["name" : "مطاعم" ,
      "more": ["اسماء الاستاد" , "اسماء المطاعم المتاحة داخل الاستاد", "قائمة الطعام" , "اطلب"]],
     
     ["name" :  "اصدقائي",
      "more": ["اقرب نقطة تجمع مع الاصدقاء"]],
  
       ["name" : "معالم قطر" ,
        "more": [" اماكن سياحية","فعاليات قطر"]],

       ["name" : "المقاهي",
        "more":[" اماكن لمشاهدة المباريات"]],
       ["name" : "",
        "more": [""]],
   
       ["name" : "المراكز الصحية",
        "more": ["المراكز"," الصيدليات"]],


    ]
    
    lazy var bigImage: UIImageView = {
        let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "qatar2022")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
//        imageView.layer.borderWidth = 1
//        imageView.layer.borderColor = self.colory.cgColor
    return imageView
    }()
    
    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        flowLayout.itemSize = CGSize(width: 100, height: 100)
     flowLayout.sectionInset = UIEdgeInsets(top:15, left: 15, bottom: 15, right: 15)
        flowLayout.minimumLineSpacing = 15
//       flowLayout.minimumInteritemSpacing = 5
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = self.colory
        collectionView.dataSource = self
        collectionView.delegate = self

    return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        navigationItem.title = "قطر ٢٠٢٠"
       let nav = navigationController?.navigationBar
        
        nav?.barTintColor = colory
        nav?.barStyle = .black
    }
    
    override func viewWillLayoutSubviews() {
        bigImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bigImage)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            
//            bigImage layout
            bigImage.topAnchor.constraint(equalTo: (navigationController?.navigationBar.bottomAnchor)!),
            bigImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            bigImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            bigImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350),
            
//            collectionView layout
            collectionView.topAnchor.constraint(equalTo:bigImage.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

            ])
    }

  }

// MARK: - Data Source
extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        for subview in cell.contentView.subviews {
        subview.removeFromSuperview()
        }
        let imageCell = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageCell.contentMode = .scaleAspectFit
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 80, width: 100, height: 20))
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 111/225.0, green: 111/225.0, blue: 111/225.0, alpha: 0.90)
        
        cell.contentView.addSubview(imageCell)
        cell.contentView.addSubview(label)
        
        let image = imageArray[indexPath.row]
        imageCell.image = image
        
        let  text = sectionArray[indexPath.row]["name"]
        label.text = text as! String?
        label.font = UIFont.systemFont(ofSize: 13)
        
        if indexPath.row == 6 {
        cell.isHidden = true
        }
        if indexPath.row == 4 {
            imageCell.contentMode = .scaleAspectFill        }
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}

// MARK: - Delegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let textArray = sectionArray[indexPath.row]["more"] as! [String]
        
        let moreView = MoreViewController(array: textArray)
        navigationController?.pushViewController(moreView, animated: true)
    }
    
    
}


