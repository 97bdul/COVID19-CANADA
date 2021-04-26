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
        label.text = "Reported Cases"
        label.propLabel(fontSize: 15, fontWeight: .thin, textColor: .label, textAlignment: .right, Backgroundcolor: .clear, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    //  SecCell view
    private let  secCellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secShadowView: UIView = {
        let view = UIView()
        return view
    }()
    
    //  CasesLabel view
    private let  casesCellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let casesShadowView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let totalCasesLabel : UILabel = {
        let label = UILabel()
        label.text = "Reported Total"
        label.propLabel(fontSize: 14, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    private let totalCasesValue : UILabel = {
        let label = UILabel()
        label.text = "12338673"
        label.propLabel(fontSize: 25, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()

    private let activeCasesLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "Active Cases"
        return label
    }()
    
    private let activeCasesValue : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "12338673"
        return label
    }()
    
    private let casesChange : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "31237"
        return label
    }()
    
    private let totalRecoveredLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "Recovery"
        return label
    }()
    
    private let totalRecoveredValue : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "312312312"
        return label
    }()
    
    private let todayRecovered : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "31237"
        return label
    }()
 
    private let TotaldeathsLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "Deaths"
        return label
    }()
    
    private let TotaldeathsValue : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "31237"
        return label
    }()
    
    private let deathsChange : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "31237"
        return label
    }()
    
    private let totalTestsLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 0, borderColor:.clear)
        label.text = "Tests"
        return label
    }()
    
    private let totalTests : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 0, borderColor:.clear)
        label.text = "122312424"
        return label
    }()
    
    private let tests : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "33232"
        return label
    }()
    
    private let totalVaccineLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "Vaccinated"
        return label
    }()
    
    private let totalVaccine : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "331321232"
        return label
    }()
    
    private let todayVaccine : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "33232"
        return label
    }()
    
    //  ACellVIew
    private let  aCellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let aShadowView: UIView = {
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
        charView.leftAxis.enabled = false
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
        set.setColor(UIColor(cgColor: #colorLiteral(red: 0.258797586, green: 0.2588401437, blue: 0.2587882876, alpha: 1)))
        
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
        view.backgroundColor = #colorLiteral(red: 0.9529150128, green: 0.6863068342, blue: 0.1333810091, alpha: 1)
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
        mylabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mylabel.trailingAnchor.constraint(equalTo: topBar.trailingAnchor,constant: -20).isActive = true
        
        secShadowView.applyshadowWithCorner(containerView: secCellView, cornerRadious: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    
        secCellView.topAnchor.constraint(equalTo: mylabel.bottomAnchor,constant: 5).isActive = true
        secCellView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -30).isActive = true
        secCellView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        secCellView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        casesShadowView.applyshadowWithCorner(containerView: casesCellView, cornerRadious: 7, color: .clear)
    
        casesCellView.topAnchor.constraint(equalTo: secCellView.topAnchor, constant: 10).isActive = true
        casesCellView.widthAnchor.constraint(equalToConstant: 155).isActive = true
        casesCellView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        casesCellView.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor,constant: 15).isActive = true
        
        totalCasesLabel.topAnchor.constraint(equalTo: casesCellView.topAnchor).isActive = true
        totalCasesLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        totalCasesLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        totalCasesLabel.leadingAnchor.constraint(equalTo: casesCellView.leadingAnchor, constant: 5).isActive = true
        
        totalCasesValue.topAnchor.constraint(equalTo: totalCasesLabel.bottomAnchor).isActive = true
        totalCasesValue.widthAnchor.constraint(equalToConstant: 250).isActive = true
        totalCasesValue.heightAnchor.constraint(equalToConstant: 24).isActive = true
        totalCasesValue.leadingAnchor.constraint(equalTo: casesCellView.leadingAnchor, constant: 5).isActive = true
    
        activeCasesLabel.topAnchor.constraint(equalTo: totalCasesValue.bottomAnchor,constant: 7).isActive = true
        activeCasesLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activeCasesLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        activeCasesLabel.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor, constant: 23).isActive = true

        activeCasesValue.topAnchor.constraint(equalTo: totalCasesValue.bottomAnchor,constant: 10).isActive = true
        activeCasesValue.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activeCasesValue.heightAnchor.constraint(equalToConstant: 20).isActive = true
        activeCasesValue.leadingAnchor.constraint(equalTo: activeCasesLabel.trailingAnchor, constant: 7).isActive = true

        casesChange.topAnchor.constraint(equalTo: totalCasesValue.bottomAnchor,constant: 10).isActive = true
        casesChange.widthAnchor.constraint(equalToConstant: 100).isActive = true
        casesChange.heightAnchor.constraint(equalToConstant: 20).isActive = true
        casesChange.leadingAnchor.constraint(equalTo: activeCasesValue.trailingAnchor, constant: 7).isActive = true

        totalRecoveredLabel.topAnchor.constraint(equalTo: activeCasesLabel.bottomAnchor,constant: 3).isActive = true
        totalRecoveredLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        totalRecoveredLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalRecoveredLabel.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor, constant: 23).isActive = true

        totalRecoveredValue.topAnchor.constraint(equalTo: activeCasesLabel.bottomAnchor,constant: 5).isActive = true
        totalRecoveredValue.widthAnchor.constraint(equalToConstant: 100).isActive = true
        totalRecoveredValue.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalRecoveredValue.leadingAnchor.constraint(equalTo: totalRecoveredLabel.trailingAnchor, constant: 7).isActive = true

        todayRecovered.topAnchor.constraint(equalTo: activeCasesLabel.bottomAnchor,constant: 5).isActive = true
        todayRecovered.widthAnchor.constraint(equalToConstant: 100).isActive = true
        todayRecovered.heightAnchor.constraint(equalToConstant: 20).isActive = true
        todayRecovered.leadingAnchor.constraint(equalTo: totalRecoveredValue.trailingAnchor, constant: 7).isActive = true

        TotaldeathsLabel.topAnchor.constraint(equalTo: totalRecoveredLabel.bottomAnchor,constant: 5).isActive = true
        TotaldeathsLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        TotaldeathsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        TotaldeathsLabel.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor, constant: 23).isActive = true

        TotaldeathsValue.topAnchor.constraint(equalTo: totalRecoveredLabel.bottomAnchor,constant: 5).isActive = true
        TotaldeathsValue.widthAnchor.constraint(equalToConstant: 100).isActive = true
        TotaldeathsValue.heightAnchor.constraint(equalToConstant: 20).isActive = true
        TotaldeathsValue.leadingAnchor.constraint(equalTo: TotaldeathsLabel.trailingAnchor, constant: 7).isActive = true

        deathsChange.topAnchor.constraint(equalTo: totalRecoveredLabel.bottomAnchor,constant: 5).isActive = true
        deathsChange.widthAnchor.constraint(equalToConstant: 100).isActive = true
        deathsChange.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deathsChange.leadingAnchor.constraint(equalTo: TotaldeathsValue.trailingAnchor, constant: 7).isActive = true

        totalTestsLabel.topAnchor.constraint(equalTo: TotaldeathsLabel.bottomAnchor,constant: 5).isActive = true
        totalTestsLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        totalTestsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalTestsLabel.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor, constant: 23).isActive = true

        totalTests.topAnchor.constraint(equalTo: TotaldeathsLabel.bottomAnchor,constant: 5).isActive = true
        totalTests.widthAnchor.constraint(equalToConstant: 100).isActive = true
        totalTests.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalTests.leadingAnchor.constraint(equalTo: totalTestsLabel.trailingAnchor, constant: 7).isActive = true

        tests.topAnchor.constraint(equalTo: TotaldeathsLabel.bottomAnchor,constant: 5).isActive = true
        tests.widthAnchor.constraint(equalToConstant: 100).isActive = true
        tests.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tests.leadingAnchor.constraint(equalTo: totalTests.trailingAnchor, constant: 7).isActive = true
        
        totalVaccineLabel.topAnchor.constraint(equalTo: totalTestsLabel.bottomAnchor,constant: 5).isActive = true
        totalVaccineLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        totalVaccineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalVaccineLabel.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor, constant: 23).isActive = true

        totalVaccine.topAnchor.constraint(equalTo: totalTestsLabel.bottomAnchor,constant: 5).isActive = true
        totalVaccine.widthAnchor.constraint(equalToConstant: 100).isActive = true
        totalVaccine.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalVaccine.leadingAnchor.constraint(equalTo: totalVaccineLabel.trailingAnchor, constant: 7).isActive = true

        todayVaccine.topAnchor.constraint(equalTo: totalTestsLabel.bottomAnchor,constant: 5).isActive = true
        todayVaccine.widthAnchor.constraint(equalToConstant: 100).isActive = true
        todayVaccine.heightAnchor.constraint(equalToConstant: 20).isActive = true
        todayVaccine.leadingAnchor.constraint(equalTo: totalVaccine.trailingAnchor, constant: 7).isActive = true
        
        aShadowView.applyshadowWithCorner(containerView: aCellView, cornerRadious: 20, color: .clear)
        
        aCellView.topAnchor.constraint(equalTo: todayVaccine.bottomAnchor, constant: 11).isActive = true
        aCellView.widthAnchor.constraint(equalTo: secCellView.widthAnchor).isActive = true
        aCellView.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor).isActive = true
        aCellView.bottomAnchor.constraint(equalTo: secCellView.bottomAnchor).isActive = true
        
        barCharView.topAnchor.constraint(equalTo: aCellView.topAnchor,constant: -8).isActive = true
        barCharView.centerXAnchor.constraint(equalTo: aCellView.centerXAnchor).isActive = true
        barCharView.widthAnchor.constraint(equalTo: aCellView.widthAnchor,constant: -50).isActive = true
        barCharView.bottomAnchor.constraint(equalTo: segmentedButtons.topAnchor ,constant: -5).isActive = true

        
        segmentedButtons.bottomAnchor.constraint(equalTo: aCellView.bottomAnchor,constant: -5).isActive = true
        segmentedButtons.widthAnchor.constraint(equalToConstant: 250).isActive = true
        segmentedButtons.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedButtons.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(topBar)
        addSubview(headLabel)
        addSubview(mylabel)
        
        addSubview(secCellView)
        addSubview(secShadowView)
        
        addSubview(casesCellView)
        addSubview(casesShadowView)
        
        addSubview(totalCasesLabel)
        addSubview(totalCasesValue)
        addSubview(activeCasesLabel)
        addSubview(activeCasesValue)
        
        addSubview(totalRecoveredLabel)
        addSubview(totalRecoveredValue)
        addSubview(todayRecovered)
        
        addSubview(TotaldeathsLabel)
        addSubview(TotaldeathsValue)
        addSubview(deathsChange)
        
        addSubview(totalTestsLabel)
        addSubview(totalTests)
        addSubview(tests)
        
        addSubview(totalVaccineLabel)
        addSubview(totalVaccine)
        addSubview(todayVaccine)
        
        addSubview(casesChange)
        
        addSubview(aCellView)
        addSubview(aShadowView)

        addSubview(barCharView)
        addSubview(segmentedButtons)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
