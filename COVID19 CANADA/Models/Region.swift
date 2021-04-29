//
//  Region.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-04-05.
//

import Foundation
import UIKit

struct Region : Codable {
    var summary : [RegionData]?
}

struct RegionData : Codable {
    let cases:Int?
    let cumulative_cases:Int?
    let cumulative_deaths:Float?
    let deaths:Float?
    let health_region:String?
    let province:String?
}

class RegionAPI {
    
    static let shared = RegionAPI()
    func fetchAPI(filterKeyword:String, url:String, collectionView: UICollectionView, completion: @escaping ([RegionData]) -> Void){
            
            guard let url = URL(string: url) else {return}
            
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                
                guard let data = data, error == nil else { return }
                do {
                    let jsonData = try JSONDecoder().decode(Region.self, from: data)
                    let filterarray = jsonData.summary?.filter({
                        $0.province == filterKeyword
                    })
                   // print("there is nothing \(filterKeyword)")
                    DispatchQueue.main.async {
                        completion(filterarray!)
                        collectionView.reloadData()
                        //print(filterarray)
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
    
}
