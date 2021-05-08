//
//  newsVC.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-04-03.
//

import UIKit

class newsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    
    var newsRes:News?
    
    private let newsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 353, height: 130)
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    //APi
    
    var searchKeyWord = "covid"
    
    
    func apiCall() {
        newsAPI.shared.fetchAPI(searchKeyword: searchKeyWord.capitalized,collectionView: newsCollectionView) { (data) in
            self.newsRes = data
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsRes?.articles.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let bodyData = newsRes?.articles[indexPath.row].title
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! topCell
        cell.configureCell(bodytext: bodyData!)
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        
        view.addSubview(newsCollectionView)
        newsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        newsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        newsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        newsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor ).isActive = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        apiCall()
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        newsCollectionView.register(topCell.self, forCellWithReuseIdentifier: topCell.identifier)
    }
}
