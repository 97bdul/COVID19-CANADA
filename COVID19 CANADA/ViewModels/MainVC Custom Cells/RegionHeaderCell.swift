//
//  RegionHeaderCell.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-04-10.
//

import UIKit
import Charts

class RegionHeaderCell: UICollectionReusableView, ChartViewDelegate {
    
    static let identifier = "RegionHeaderCell"
    
    //  TopBar
    private let topBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headLabel: UILabel = {
        let imView = UILabel()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ALBERTA"
        label.propLabel(fontSize: 25, fontWeight: .semibold, textColor: .label, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    //  TopBar Label
    private let mylabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reported Statistics"
        label.propLabel(fontSize: 15, fontWeight: .thin, textColor: .label, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    //  SecCell view
    private let  secCellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.08229341358, green: 0.1960955858, blue: 0.3176031709, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secShadowView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let totalCasesLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let activeCasesLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .systemRed, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let totalTests : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 0, borderColor:.clear)
        return label
    }()
    
    private let totalRecovered : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .green, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let totalDeaths : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 0, borderColor:.clear)
        return label
    }()
    
    private let tests : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .green, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let deaths : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .green, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let cases : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .green, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let totalVaccine : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .green, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let todayVaccine : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .green, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    //  ACellVIew
    private let  aCellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2626857758, green: 0.3725990057, blue: 0.9410600066, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let aShadowView: UIView = {
        let view = UIView()
        return view
    }()
    
    //  BCellVIew
    private let  bCellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2626857758, green: 0.3725990057, blue: 0.9410600066, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bShadowView: UIView = {
        let view = UIView()
        return view
    }()
    
    //  Barchart
    private let barCharShadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let barCharView: BarChartView = {
        let charView = BarChartView()
        charView.translatesAutoresizingMaskIntoConstraints = false
        
        charView.rightAxis.drawGridLinesEnabled = false
        charView.leftAxis.drawGridLinesEnabled = false
        charView.xAxis.drawGridLinesEnabled = false
        charView.rightAxis.enabled = false
        charView.leftAxis.enabled = true
        charView.leftAxis.labelTextColor = .white
        charView.xAxis.enabled = true
        charView.legend.enabled = false
        charView.doubleTapToZoomEnabled = false
        charView.xAxis.labelTextColor = .systemBackground
        charView.xAxis.labelPosition = .bottom
        charView.xAxis.axisLineColor = .systemBackground
        charView.drawBarShadowEnabled = false
        charView.fitBars = true
        
        return charView
    }()
    
    func configLineCharView(entries : [BarChartDataEntry],monVals : [String], selectedProvince: String) {
        let set = BarChartDataSet(entries: entries)
        set.barShadowColor = #colorLiteral(red: 0.4093846275, green: 0.4093846275, blue: 0.4093846275, alpha: 0.2955500116)
        set.drawValuesEnabled = false
        
        var newArray : [String] = []
        for i in 0..<monVals.count{
            let res = String(monVals[i])
            //            var newr = res.startIndex...res.index(res.startIndex, offsetBy: 2)
            //            res.removeSubrange(newr)
            let grr = String(res.prefix(2))
            newArray.append(grr)
        }
        barCharView.xAxis.valueFormatter = IndexAxisValueFormatter(values: newArray)
        barCharView.xAxis.granularity = 1
        let data = BarChartData(dataSet: set)
        barCharView.data = data
        data.barWidth = 0.5
    }
    
    //  Segmented button
    private var segmentedButtons: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        topBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        topBar.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        topBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        headLabel.topAnchor.constraint(equalTo: topBar.topAnchor, constant: 5).isActive = true
        headLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        headLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        headLabel.leadingAnchor.constraint(equalTo: topBar.leadingAnchor, constant: 15).isActive = true
        
        mylabel.topAnchor.constraint(equalTo: topBar.topAnchor, constant: -5).isActive = true
        mylabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        mylabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mylabel.trailingAnchor.constraint(equalTo: topBar.trailingAnchor,constant: -15).isActive = true
        
        secShadowView.applyshadowWithCorner(containerView: secCellView, cornerRadious: 15, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    
        secCellView.topAnchor.constraint(equalTo: mylabel.bottomAnchor).isActive = true
        secCellView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -30).isActive = true
        secCellView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        secCellView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        
        aShadowView.applyshadowWithCorner(containerView: aCellView, cornerRadious: 15, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
        aCellView.topAnchor.constraint(equalTo: secCellView.bottomAnchor, constant: 11).isActive = true
        aCellView.widthAnchor.constraint(equalToConstant: 225).isActive = true
        aCellView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        aCellView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15).isActive = true
        
        bShadowView.applyshadowWithCorner(containerView: bCellView, cornerRadious: 15, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
        bCellView.topAnchor.constraint(equalTo: secCellView.bottomAnchor, constant: 11).isActive = true
        bCellView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        bCellView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        bCellView.leadingAnchor.constraint(equalTo: aCellView.trailingAnchor, constant: 20).isActive = true
        
        barCharView.topAnchor.constraint(equalTo: aCellView.topAnchor,constant: 5).isActive = true
        barCharView.widthAnchor.constraint(equalTo: aCellView.widthAnchor,constant: -25).isActive = true
        barCharView.centerXAnchor.constraint(equalTo: aCellView.centerXAnchor).isActive = true
        barCharView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        segmentedButtons.topAnchor.constraint(equalTo: aCellView.bottomAnchor, constant: 15).isActive = true
        segmentedButtons.widthAnchor.constraint(equalToConstant: 250).isActive = true
        segmentedButtons.heightAnchor.constraint(equalToConstant: 27).isActive = true
        segmentedButtons.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(topBar)
        addSubview(headLabel)
        addSubview(mylabel)
        
        addSubview(secCellView)
        addSubview(secShadowView)
        
        addSubview(totalCasesLabel)
        addSubview(activeCasesLabel)
        addSubview(totalTests)
        addSubview(totalVaccine)
        addSubview(totalRecovered)
        addSubview(totalDeaths)
        addSubview(tests)
        addSubview(todayVaccine)
        addSubview(deaths)
        addSubview(cases)
        
        addSubview(aCellView)
        addSubview(aShadowView)
        
        addSubview(bCellView)
        addSubview(bShadowView)
        addSubview(barCharView)
        addSubview(segmentedButtons)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

