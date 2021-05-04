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
        label.propLabel(fontSize: 20, fontWeight: .regular, textColor: .label, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    private let totalHeading : UILabel = {
        let label = UILabel()
        label.text = "cumulative"
        label.propLabel(fontSize: 13, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    private let changeHeading : UILabel = {
        let label = UILabel()
        label.text = "change"
        label.propLabel(fontSize: 25, fontWeight: .regular,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    //  CasesLabel view
    private let  casesCellView: UIView = {
        let view = UIView()
        view.backgroundColor = .link
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
        label.propLabel(fontSize: 13, fontWeight: .semibold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    private let totalCasesValue : UILabel = {
        let label = UILabel()
        label.text = "12338673"
        label.propLabel(fontSize: 25, fontWeight: .regular,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    //  SecCell view
    private let  secCellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.895261954)
        //#colorLiteral(red: 0.9724630713, green: 0.9765254855, blue: 0.9841967225, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secShadowView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let summaryLabel: UILabel = {
        let imView = UILabel()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Summary Stats"
        label.propLabel(fontSize: 16.5, fontWeight: .regular, textColor: .label, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    private let activeCasesLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: #colorLiteral(red: 0.2548710108, green: 0.2745279074, blue: 0.3019200563, alpha: 1), textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "ACTIVE CASES"
        return label
    }()
    
    private let activeCasesValue : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: #colorLiteral(red: 0.2548710108, green: 0.2745279074, blue: 0.3019200563, alpha: 1), textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "12338673"
        return label
    }()
    
    private let casesChange : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: #colorLiteral(red: 0.2548710108, green: 0.2745279074, blue: 0.3019200563, alpha: 1), textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "31237"
        return label
    }()
    
    private let totalRecoveredLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .link, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "RECOVERY"
        return label
    }()
    
    private let totalRecoveredValue : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .link, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "312312312"
        return label
    }()
    
    private let todayRecovered : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .link, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "31237"
        return label
    }()
    
    private let totalTestsLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: #colorLiteral(red: 0.2548710108, green: 0.2745279074, blue: 0.3019200563, alpha: 1), textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 0, borderColor:.clear)
        label.text = "TESTS"
        return label
    }()
    
    private let totalTests : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: #colorLiteral(red: 0.2548710108, green: 0.2745279074, blue: 0.3019200563, alpha: 1), textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 0, borderColor:.clear)
        label.text = "122312424"
        return label
    }()
    
    private let tests : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: #colorLiteral(red: 0.2548710108, green: 0.2745279074, blue: 0.3019200563, alpha: 1), textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "300000"
        return label
    }()
    
    private let TotaldeathsLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .link, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "DEATHS"
        return label
    }()
    
    private let TotaldeathsValue : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .link, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "31237"
        return label
    }()
    
    private let deathsChange : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: .link, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "31237"
        return label
    }()
    
    private let totalVaccineLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: #colorLiteral(red: 0.2548710108, green: 0.2745279074, blue: 0.3019200563, alpha: 1), textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "VACCINATED"
        return label
    }()
    
    private let totalVaccine : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: #colorLiteral(red: 0.2548710108, green: 0.2745279074, blue: 0.3019200563, alpha: 1), textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "331321232"
        return label
    }()
    
    private let todayVaccine : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .semibold,textColor: #colorLiteral(red: 0.2548710108, green: 0.2745279074, blue: 0.3019200563, alpha: 1), textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        label.text = "33232"
        return label
    }()
    
    //  ACellVIew
    private let  aCellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.895261954)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    //  Segmented button
//    private var segmentedButtons: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        view.layer.cornerRadius = 15
//        return view
//    }()
  
    
    private let CasesWeekly: UILabel = {
        let imView = UILabel()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cases / Week"
        label.propLabel(fontSize: 16.5, fontWeight: .regular, textColor: .label, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        return label
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
        charView.xAxis.labelTextColor = .link
        charView.xAxis.labelPosition = .bottom
        charView.xAxis.axisLineColor = .clear
        charView.drawBarShadowEnabled = false
        charView.fitBars = true
        
        return charView
    }()
    
    func configLineCharView(entries : [BarChartDataEntry],monVals : [String], selectedProvince: String) {
        
        headLabel.text = selectedProvince.uppercased()
        
        let set = BarChartDataSet(entries: entries)
        set.barShadowColor = #colorLiteral(red: 0.4093846275, green: 0.4093846275, blue: 0.4093846275, alpha: 0.2955500116)
        set.drawValuesEnabled = true
        set.setColor(UIColor(cgColor: #colorLiteral(red: 0.2051599682, green: 0.2306319645, blue: 0.2586530219, alpha: 1)))
        
        
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
        data.barWidth = 0.3
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        topBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        topBar.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        topBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        headLabel.topAnchor.constraint(equalTo: topBar.topAnchor, constant: 7).isActive = true
        headLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        headLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        headLabel.leadingAnchor.constraint(equalTo: topBar.leadingAnchor,constant: 21).isActive = true
        
        casesShadowView.applyshadowWithCorner(containerView: casesCellView, cornerRadious: 15, color: #colorLiteral(red: 0, green: 0.3161689687, blue: 0.9998757243, alpha: 1))
        
        casesCellView.topAnchor.constraint(equalTo: headLabel.bottomAnchor,constant: 8).isActive = true
        casesCellView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -40).isActive = true
        casesCellView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        casesCellView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        totalCasesLabel.topAnchor.constraint(equalTo: casesCellView.topAnchor,constant: 5).isActive = true
        totalCasesLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        totalCasesLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        totalCasesLabel.leadingAnchor.constraint(equalTo: casesCellView.leadingAnchor, constant: 15).isActive = true
        
        totalCasesValue.topAnchor.constraint(equalTo: totalCasesLabel.bottomAnchor,constant: 3).isActive = true
        totalCasesValue.widthAnchor.constraint(equalToConstant: 250).isActive = true
        totalCasesValue.heightAnchor.constraint(equalToConstant: 24).isActive = true
        totalCasesValue.leadingAnchor.constraint(equalTo: casesCellView.leadingAnchor, constant: 12).isActive = true
        
        summaryLabel.topAnchor.constraint(equalTo: casesCellView.bottomAnchor, constant: 10).isActive = true
        summaryLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        summaryLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        summaryLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 21).isActive = true
        
        secShadowView.applyshadowWithCorner(containerView: secCellView, cornerRadious: 15, color: #colorLiteral(red: 0, green: 0.4784809947, blue: 0.9998757243, alpha: 0.2189956564))
        
        secCellView.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor,constant: 15).isActive = true
        secCellView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -40).isActive = true
        secCellView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        secCellView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        activeCasesLabel.topAnchor.constraint(equalTo: secCellView.topAnchor,constant: 13).isActive = true
        activeCasesLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
        activeCasesLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        activeCasesLabel.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor, constant: 17).isActive = true
        
        activeCasesValue.topAnchor.constraint(equalTo: secCellView.topAnchor,constant: 13).isActive = true
        activeCasesValue.widthAnchor.constraint(equalToConstant: 115).isActive = true
        activeCasesValue.heightAnchor.constraint(equalToConstant: 20).isActive = true
        activeCasesValue.leadingAnchor.constraint(equalTo: activeCasesLabel.trailingAnchor, constant: 8).isActive = true
        
        casesChange.topAnchor.constraint(equalTo: secCellView.topAnchor,constant: 13).isActive = true
        casesChange.widthAnchor.constraint(equalToConstant: 115).isActive = true
        casesChange.heightAnchor.constraint(equalToConstant: 20).isActive = true
        casesChange.leadingAnchor.constraint(equalTo: activeCasesValue.trailingAnchor, constant: 5).isActive = true
        
        totalRecoveredLabel.topAnchor.constraint(equalTo: activeCasesLabel.bottomAnchor,constant: 7).isActive = true
        totalRecoveredLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
        totalRecoveredLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalRecoveredLabel.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor, constant: 17).isActive = true
        
        totalRecoveredValue.topAnchor.constraint(equalTo: activeCasesLabel.bottomAnchor,constant: 7).isActive = true
        totalRecoveredValue.widthAnchor.constraint(equalToConstant: 115).isActive = true
        totalRecoveredValue.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalRecoveredValue.leadingAnchor.constraint(equalTo: totalRecoveredLabel.trailingAnchor, constant: 7).isActive = true
        
        todayRecovered.topAnchor.constraint(equalTo: activeCasesLabel.bottomAnchor,constant: 5).isActive = true
        todayRecovered.widthAnchor.constraint(equalToConstant: 115).isActive = true
        todayRecovered.heightAnchor.constraint(equalToConstant: 20).isActive = true
        todayRecovered.leadingAnchor.constraint(equalTo: totalRecoveredValue.trailingAnchor, constant: 7).isActive = true
        
        totalTestsLabel.topAnchor.constraint(equalTo: totalRecoveredLabel.bottomAnchor,constant: 7).isActive = true
        totalTestsLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
        totalTestsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalTestsLabel.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor, constant: 17).isActive = true
        
        totalTests.topAnchor.constraint(equalTo: totalRecoveredLabel.bottomAnchor,constant: 5).isActive = true
        totalTests.widthAnchor.constraint(equalToConstant: 115).isActive = true
        totalTests.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalTests.leadingAnchor.constraint(equalTo: totalTestsLabel.trailingAnchor, constant: 7).isActive = true
        
        tests.topAnchor.constraint(equalTo: totalRecoveredLabel.bottomAnchor,constant: 7).isActive = true
        tests.widthAnchor.constraint(equalToConstant: 115).isActive = true
        tests.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tests.leadingAnchor.constraint(equalTo: totalTests.trailingAnchor, constant: 7).isActive = true
        
        TotaldeathsLabel.topAnchor.constraint(equalTo: totalTestsLabel.bottomAnchor,constant: 7).isActive = true
        TotaldeathsLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
        TotaldeathsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        TotaldeathsLabel.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor, constant: 17).isActive = true
        
        TotaldeathsValue.topAnchor.constraint(equalTo: totalTestsLabel.bottomAnchor,constant: 5).isActive = true
        TotaldeathsValue.widthAnchor.constraint(equalToConstant: 115).isActive = true
        TotaldeathsValue.heightAnchor.constraint(equalToConstant: 20).isActive = true
        TotaldeathsValue.leadingAnchor.constraint(equalTo: TotaldeathsLabel.trailingAnchor, constant: 7).isActive = true
        
        deathsChange.topAnchor.constraint(equalTo: totalTestsLabel.bottomAnchor,constant: 7).isActive = true
        deathsChange.widthAnchor.constraint(equalToConstant: 115).isActive = true
        deathsChange.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deathsChange.leadingAnchor.constraint(equalTo: TotaldeathsValue.trailingAnchor, constant: 7).isActive = true
        
        totalVaccineLabel.topAnchor.constraint(equalTo: TotaldeathsLabel.bottomAnchor,constant: 7).isActive = true
        totalVaccineLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
        totalVaccineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalVaccineLabel.leadingAnchor.constraint(equalTo: secCellView.leadingAnchor, constant: 17).isActive = true
        
        totalVaccine.topAnchor.constraint(equalTo: TotaldeathsLabel.bottomAnchor,constant: 5).isActive = true
        totalVaccine.widthAnchor.constraint(equalToConstant: 115).isActive = true
        totalVaccine.heightAnchor.constraint(equalToConstant: 20).isActive = true
        totalVaccine.leadingAnchor.constraint(equalTo: totalVaccineLabel.trailingAnchor, constant: 7).isActive = true
        
        todayVaccine.topAnchor.constraint(equalTo: TotaldeathsLabel.bottomAnchor,constant: 7).isActive = true
        todayVaccine.widthAnchor.constraint(equalToConstant: 115).isActive = true
        todayVaccine.heightAnchor.constraint(equalToConstant: 20).isActive = true
        todayVaccine.leadingAnchor.constraint(equalTo: totalVaccine.trailingAnchor, constant: 7).isActive = true
        
        CasesWeekly.topAnchor.constraint(equalTo: secCellView.bottomAnchor,constant: 10).isActive = true
        CasesWeekly.widthAnchor.constraint(equalToConstant: 250).isActive = true
        CasesWeekly.heightAnchor.constraint(equalToConstant: 30).isActive = true
        CasesWeekly.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 21).isActive = true
        
        aShadowView.applyshadowWithCorner(containerView: aCellView, cornerRadious: 15, color: #colorLiteral(red: 0, green: 0.4784809947, blue: 0.9998757243, alpha: 0.2189947469))
        
        aCellView.topAnchor.constraint(equalTo: CasesWeekly.bottomAnchor, constant: 10).isActive = true
        aCellView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        aCellView.widthAnchor.constraint(equalTo: casesCellView.widthAnchor).isActive = true
        aCellView.leadingAnchor.constraint(equalTo: casesCellView.leadingAnchor).isActive = true
        
        barCharView.topAnchor.constraint(equalTo: aCellView.topAnchor).isActive = true
        barCharView.centerXAnchor.constraint(equalTo: aCellView.centerXAnchor).isActive = true
        barCharView.widthAnchor.constraint(equalTo: aCellView.widthAnchor,constant: -20).isActive = true
        barCharView.heightAnchor.constraint(equalTo: aCellView.heightAnchor, constant: -10).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(topBar)
        addSubview(headLabel)
        
        addSubview(casesCellView)
        addSubview(casesShadowView)
        
        addSubview(secCellView)
        addSubview(secShadowView)
        
        addSubview(summaryLabel)
        
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
        
        addSubview(CasesWeekly)
        
        addSubview(casesChange)
        
        addSubview(aCellView)
        addSubview(aShadowView)
        
        addSubview(barCharView)

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
