//
//  provincialVC.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-03-28.
//

import UIKit
import Charts

class RegionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, ChartViewDelegate {
    
    var jsonData = [] as [RegionData]
    var timeSeriesData:TimeSeries?
    public var completion: ((String) -> Void)?
    var dataFromSelection: String = ""
    static let identifier = "RegionVC"
    var entries = [BarChartDataEntry]()
    var moNths: [String] = []
    
    //    API Call
    func APICall(){
        
        timeSeriesAPI.shared.fetchAPI(selectedProvince: self.dataFromSelection) { (data) in
            let count = data.cases.count
            for i in 0..<count {
                let xData = Double(i)
                let yData = Double(data.cases[i].cumulative_cases)
                self.entries.append(BarChartDataEntry(x: xData, y: yData))
                self.moNths.append(data.cases[i].date_report)
            }
        }
        RegionAPI.shared.fetchAPI(filterKeyword: self.dataFromSelection,url: urlConstants.HRurl, collectionView: self.myCollectionView) { (kdata) in
            self.jsonData = kdata
        }
    }
    
    //    ProvinceData from mainVC
    public var completionHandler: ((String?) -> Void)?
    
    private let myCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 355, height: 85)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    //  ChartView Delegate
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
        
    }
    
    //    CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let today = jsonData[indexPath.row].cases
        let tDeaths = jsonData[indexPath.row].cumulative_deaths
        let tCases = jsonData[indexPath.row].cumulative_cases
        let regionName = jsonData[indexPath.row].health_region
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RegionCell", for: indexPath) as! RegionCell
        cell.configure(region: regionName!, totCase: tCases!, todCases: today!, totDeaths: tDeaths!)
        return cell
    }
    
    //  HeaderCollectionViewCell
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RegionHeaderCell.identifier, for: indexPath) as! RegionHeaderCell
        
        header.configLineCharView(entries: entries,monVals: moNths ,selectedProvince: dataFromSelection)
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width , height: 430)
    }
    
    //  ViewDidLayoutSubViews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(myCollectionView)
        myCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //  ViewDiDLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        completion = { text in
            self.dataFromSelection = text
            self.APICall()
            
        }
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(RegionCell.self, forCellWithReuseIdentifier: RegionCell.identifier)
        myCollectionView.register(RegionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RegionHeaderCell.identifier)
        
    }
    
}
