//
//  FourthCVC.swift
//  COVID19 CANADA
//
//  Created by Abdul R on 2021-05-04.
//

import UIKit

class FourthCVC: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    //    primary horizantal scrollVIew
    private let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 365 , height: 300)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout:layout)
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
        
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthCustomCell", for: indexPath) as! FourthCustomCell
        cell.backgroundColor = .yellow
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(myCollectionView)
        myCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        myCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(FourthCustomCell.self, forCellWithReuseIdentifier: FourthCustomCell.identifier)
    }
    
    
}
