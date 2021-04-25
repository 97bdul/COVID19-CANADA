//
//  Covid.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-03-28.
//

import Foundation
import UIKit

struct urlConstants{
    static let ONurl:String = "https://api.opencovid.ca/summary"
    static let HRurl:String = "https://api.opencovid.ca/summary?loc=hr"
    static let CAurl:String = "https://api.opencovid.ca"
}

struct Covid: Codable {
    let summary: [CovidData] 
}
struct CovidData: Codable {
    let cases:Int
    let active_cases:Int
    let recovered:Int
    let testing:Int
    let province:String
    let cumulative_cases:Int?
    let cumulative_deaths:Float
    let cumulative_recovered:Float
    let cumulative_testing:Float
    
}

class covidAPI {
    
    static let shared = covidAPI()
    
    func fecthAPI(url:String,collectionView:UICollectionView,completion: @escaping (Covid) -> Void){
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data, error == nil else { return }
            do {
                let jsonData = try JSONDecoder().decode(Covid.self, from: data)
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


class covidFilteredAPI {
    
    static let shared = covidFilteredAPI()
    
    func fecthAPI(url:String,provinceText: String,collectionView:UICollectionView,completion: @escaping ([CovidData]) -> Void){
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data, error == nil else { return }
            do {
                let jsonData = try JSONDecoder().decode(Covid.self, from: data)
                let arr = jsonData.summary.filter {$0.province == provinceText }
                DispatchQueue.main.async {
                    collectionView.reloadData()
                    completion(arr)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}


