//
//  provincialCell.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-04-05.
//

import UIKit

class RegionCell: UICollectionViewCell {
    
    static let identifier = "RegionCell"
    
    private let cellView : UIView = {
        let view = UIView()
        view.backgroundColor = .link
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let regionLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16.5, fontWeight: .regular, textColor: .label, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    private let todayCasesLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let totalCasesLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let totalRecovLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let totalDeathsLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 15, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    func configure(region: String, totCase: Int, todCases: Int, totDeaths: Float){
        regionLabel.text = "\(region)"
        
        let IntofTodDeaths = Int(totDeaths)
        totalCasesLabel.text  = "Total CASES     \(totCase) "
        todayCasesLabel.text  = "New CASES      \(todCases)"
        totalDeathsLabel.text = "New DEATHS   \(IntofTodDeaths)"
        totalRecovLabel.text  = "New  RECOV     \(todCases)"
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        regionLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        regionLabel.widthAnchor.constraint(equalTo:contentView.widthAnchor).isActive = true
        regionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        regionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5).isActive = true
        
        cellView.topAnchor.constraint(equalTo: regionLabel.bottomAnchor,constant: 3).isActive = true
        cellView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        shadowView.applyshadowWithCorner(containerView: cellView, cornerRadious: 8, color: #colorLiteral(red: 0, green: 0.3161689687, blue: 0.9998757243, alpha: 1))
        
        shadowView.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        shadowView.widthAnchor.constraint(equalTo: cellView.widthAnchor).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor).isActive = true
        shadowView.heightAnchor.constraint(equalTo: cellView.heightAnchor).isActive = true
        
        contentView.addSubview(totalCasesLabel)
        totalCasesLabel.topAnchor.constraint(equalTo: cellView.topAnchor,constant: 3).isActive = true
        totalCasesLabel.widthAnchor.constraint(equalToConstant: 185).isActive = true
        totalCasesLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        totalCasesLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor,constant: 10).isActive = true
        
        contentView.addSubview(todayCasesLabel)
        todayCasesLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 3).isActive = true
        todayCasesLabel.widthAnchor.constraint(equalToConstant: 145).isActive = true
        todayCasesLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        todayCasesLabel.leadingAnchor.constraint(equalTo: totalCasesLabel.trailingAnchor).isActive = true
        
        contentView.addSubview(totalRecovLabel)
        totalRecovLabel.topAnchor.constraint(equalTo: todayCasesLabel.bottomAnchor, constant: -1).isActive = true
        totalRecovLabel.widthAnchor.constraint(equalToConstant: 185).isActive = true
        totalRecovLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        totalRecovLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor,constant: 10).isActive = true
        
        contentView.addSubview(totalDeathsLabel)
        totalDeathsLabel.topAnchor.constraint(equalTo: todayCasesLabel.bottomAnchor, constant: -1).isActive = true
        totalDeathsLabel.widthAnchor.constraint(equalToConstant: 145).isActive = true
        totalDeathsLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        totalDeathsLabel.leadingAnchor.constraint(equalTo: totalRecovLabel.trailingAnchor).isActive = true
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(regionLabel)
        contentView.addSubview(cellView)
        contentView.addSubview(shadowView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
