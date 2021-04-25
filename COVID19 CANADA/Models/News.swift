//
//  News.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-03-31.
//

import Foundation
import UIKit

struct News: Codable {
    let articles: [Articles]
}

struct Articles: Codable {
    
    let title:String?
    let description:String?
    let url:String?
    let urlToImage:String?
    
}

class newsAPI{
    
    static let shared = newsAPI()

    func fetchAPI(searchKeyword: String, collectionView:UICollectionView,completion: @escaping (News) -> Void){
        
        let newsURL:String = "https://newsapi.org/v2/top-headlines?q=\(searchKeyword)&country=ca&apiKey=4d52face8099489f991f73746aa9c603"
        
        guard let url = URL(string: newsURL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data, error == nil else { return }
            do {
                let jsonData = try JSONDecoder().decode(News.self, from: data)
                DispatchQueue.main.async {
                    collectionView.reloadData()
                    completion(jsonData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
