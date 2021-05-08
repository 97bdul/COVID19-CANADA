//
//  mainVC.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-03-28.
//

import Foundation
import UIKit

struct mainConstants {
    static let collectionViewBgColor : UIColor = .systemBackground
}

class mainVC: UIViewController,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var jsonRes:Covid?
    var newsRes:News?
    static let shared = mainVC()
    var provinceName2RegionVC: String?
    
    let newsKeyword = "Covid"
    
    //APICalls
    func apiCall() {
        covidAPI.shared.fecthAPI(url:urlConstants.ONurl,collectionView: bottomCollectionView) { (data) in
            self.jsonRes = data
        }
        newsAPI.shared.fetchAPI(searchKeyword: newsKeyword, collectionView: topCollectionView) { (data) in
            self.newsRes = data
        }
    }
    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
        
    }()
    
    private let headViewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "mapleLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let headViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CANADA COVID19"
        label.font = UIFont.systemFont(ofSize: 23.5, weight: UIFont.Weight.semibold)
        return label
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .red
        return button
    }()
    
    private let topCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 347, height: 125)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = #colorLiteral(red: 0.9842278361, green: 0.9843689799, blue: 0.992039144, alpha: 1)
        return collectionView
        
    }()
    
    private let bottomCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 7, left: 20, bottom: 7, right: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = #colorLiteral(red: 0.9842278361, green: 0.9843689799, blue: 0.992039144, alpha: 1)
        return collectionView
        
    }()
    
    /// CollectionView Docking
    /// - Parameters:
    ///   - collectionView: topCollectionView, BottomCollectionView
    /// - Returns: cell count and collectionViews
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == bottomCollectionView) {
            return jsonRes?.summary.count ?? 0
        }
        return newsRes?.articles.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == bottomCollectionView) {
            
            let provincetext = jsonRes?.summary[indexPath.row].province
            let activeCasestext = jsonRes?.summary[indexPath.row].active_cases
            let totalDeaths = jsonRes?.summary[indexPath.row].cumulative_deaths
            let totRecoverd = jsonRes?.summary[indexPath.row].cumulative_recovered
            let totaltext = jsonRes?.summary[indexPath.row].cumulative_cases
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as! bottomCell
            cell.configureCell(totalCases: totaltext!, provinceName: provincetext!, active_cases: activeCasestext!, totDeath: totalDeaths!, totrecoverd: totRecoverd!)
            return cell
        }
        
        let bodyData = newsRes?.articles[indexPath.row].title
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! topCell
        cell.configureCell(bodytext: bodyData!)
        return cell
    }
    
    //selected cell
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == bottomCollectionView) {
            
            if let data = jsonRes?.summary[indexPath.row].province {
                provinceName2RegionVC = String(data) //selected province name
                switchVC()
                
            } else { return }
            
        } else { return }
    }
    
    //Action
    func switchVC(){
        let vc: RegionVC = RegionVC()
        DispatchQueue.main.async {
            self.present(vc, animated: true)
            vc.completion?(self.provinceName2RegionVC!)//completionHandler to shareData
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        view.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        view.addSubview(headViewImage)
        headViewImage.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        headViewImage.heightAnchor.constraint(equalToConstant: 47.5).isActive = true
        headViewImage.widthAnchor.constraint(equalToConstant: 47.5).isActive = true
        headViewImage.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 15).isActive = true
        
        view.addSubview(headViewLabel)
        headViewLabel.topAnchor.constraint(equalTo: headViewImage.topAnchor).isActive = true
        headViewLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        headViewLabel.widthAnchor.constraint(equalToConstant: 220).isActive = true
        headViewLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 20).isActive = true
        
        view.addSubview(searchButton)
        searchButton.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: -20).isActive = true
        
        view.addSubview(topCollectionView)
        topCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        topCollectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        topCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        topCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        view.addSubview(bottomCollectionView)
        bottomCollectionView.topAnchor.constraint(equalTo: topCollectionView.bottomAnchor).isActive = true
        bottomCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor ).isActive = true
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        apiCall()
        
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        topCollectionView.register(topCell.self, forCellWithReuseIdentifier: topCell.identifier)
        
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        bottomCollectionView.register(bottomCell.self, forCellWithReuseIdentifier: bottomCell.identifier)
    }
}
