//
//  TimeSeries.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-04-02.
//

import Foundation
import UIKit

struct TimeSeries: Codable {
    let active:[ActiveStat]
    let cvaccine:[Cvaccine]
    let avaccine:[Avaccine]
    let cases:[CasesStat]
    let mortality:[Mortality]
    let recovered:[Recovered]
    let testing:[Tested]
}

struct ActiveStat : Codable {
    let active_cases:Int
    let active_cases_change:Int
    let cumulative_cases:Int
    let cumulative_deaths:Int
    let cumulative_recovered:Int
    let province:String
    let date_active:String
}
struct Cvaccine:Codable{
    let cumulative_cvaccine:Int
    let cvaccine:Int
    let date_vaccine_completed:String
    let province:String
}
struct Avaccine : Codable {
    let cumulative_avaccine:Int
    let avaccine:Int
    let date_vaccine_administered:String
    let province:String
}
struct CasesStat:Codable{
    let cases:Int
    let cumulative_cases:Int
    let date_report:String
    let province:String
}
struct Mortality: Codable{
    let cumulative_deaths:Int
    let date_death_report:String
    let deaths:Int
    let province:String
}
struct Recovered: Codable{
    let cumulative_recovered:Int
    let date_recovered:String
    //let province:String
    let recovered:Int
}
struct Tested: Codable{
    let cumulative_testing:Int
    let date_testing:String
    let province:String
    let testing:Int
}

class timeSeriesAPI {
    
    static let shared = timeSeriesAPI()
    
    func fetchAPI(selectedProvince:String, completion: @escaping (TimeSeries) -> Void){
        
        let provinceCodeArray : [String:String] = [ "Alberta": "AB", "BC": "BC", "Manitoba": "MB", "New Brunswick": "NB", "NL": "NL", "NWT": "NT", "Nova Scotia": "NS", "Nunavut": "NU", "Ontario": "ON", "PEI": "PE", "Quebec": "QC", "Saskatchewan": "SK", "Yukon": "YT", "Repatriated": "RP" ]
        
        var provCode = ""
        
        for (key, val) in provinceCodeArray {
            if key.capitalized == selectedProvince.capitalized{
                provCode = val
            }
        }
        let TSurl:String = "https://api.opencovid.ca/timeseries?stat=summary&loc=\(provCode)&after=11-04-2021&before=17-04-2021"
        
        guard let url = URL(string: TSurl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data, error == nil else { return }
            do {
                let jsonData = try JSONDecoder().decode(TimeSeries.self, from: data)
                DispatchQueue.main.async {
                    completion(jsonData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
