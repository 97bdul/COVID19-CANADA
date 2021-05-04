//
//  bottomCell.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-04-02.
//

import UIKit

struct bottomConstanats {
    
    static let cellShadowColor: UIColor = #colorLiteral(red: 0, green: 0.3293530925, blue: 0.9998757243, alpha: 1)
    static let cellCornerRadius: CGFloat = 10
    static let cellBgClr: UIColor = .link
    
    static let dataLabelCR: CGFloat = 10
}

class bottomCell: UICollectionViewCell {
    
    static let identifier = "bottomCell"
    
    private let cellView : UIView = {
        let view = UIView()
        view.backgroundColor = bottomConstanats.cellBgClr
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// propLabel function in extensions
    private let provLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 17.5, fontWeight: .semibold,textColor: .label, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: 8, borderWidth: 0, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0))
        return label
    }()
    
    private let totalCasesLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let activeCasesLabel : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    private let totalDeaths : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .systemBackground, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 0, borderColor:.clear)
        return label
    }()
    
    private let totalRecovered : UILabel = {
        let label = UILabel()
        label.propLabel(fontSize: 16, fontWeight: .bold,textColor: .green, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: bottomConstanats.dataLabelCR, borderWidth: 1, borderColor: .clear)
        return label
    }()
    
    override func layoutSubviews() {
        
    
        //applyshadowWithCorner() function in extensions.swift file
        shadowView.applyshadowWithCorner(containerView: cellView, cornerRadious: 8, color: bottomConstanats.cellShadowColor)
        
        provLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        provLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor,constant: -5).isActive = true
        provLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        provLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5).isActive = true
        
        cellView.topAnchor.constraint(equalTo: provLabel.bottomAnchor).isActive = true
        cellView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        shadowView.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        shadowView.widthAnchor.constraint(equalTo: cellView.widthAnchor).isActive = true
        shadowView.heightAnchor.constraint(equalTo: cellView.heightAnchor).isActive = true
        
        totalCasesLabel.topAnchor.constraint(equalTo: provLabel.bottomAnchor, constant: 5).isActive = true
        totalCasesLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor).isActive = true
        totalCasesLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        totalCasesLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor,constant: 10).isActive = true
        
        activeCasesLabel.topAnchor.constraint(equalTo: totalCasesLabel.bottomAnchor,constant: 2).isActive = true
        activeCasesLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor).isActive = true
        activeCasesLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        activeCasesLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor,constant: 10).isActive = true
        
        totalRecovered.topAnchor.constraint(equalTo: activeCasesLabel.bottomAnchor, constant: 2).isActive = true
        totalRecovered.widthAnchor.constraint(equalTo: cellView.widthAnchor).isActive = true
        totalRecovered.heightAnchor.constraint(equalToConstant: 25).isActive = true
        totalRecovered.leadingAnchor.constraint(equalTo: cellView.leadingAnchor,constant: 10).isActive = true
        
        totalDeaths.topAnchor.constraint(equalTo: totalRecovered.bottomAnchor, constant: 2).isActive = true
        totalDeaths.widthAnchor.constraint(equalTo: cellView.widthAnchor,constant: -10).isActive = true
        totalDeaths.heightAnchor.constraint(equalToConstant: 25).isActive = true
        totalDeaths.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10).isActive =  true
        
    }
    
    public func configureCell(totalCases:Int, provinceName:String, active_cases:Int, totDeath:Float, totrecoverd:Float) {
        
        provLabel.text = provinceName
        totalCasesLabel.text = "CASES   \(totalCases)"
        activeCasesLabel.text = "ACTIVE  \(active_cases)"
        
        let totD = Int(totDeath)
        let totR = Int(totrecoverd)
        
        totalDeaths.text = "DEATH    \(totD)"
        totalRecovered.text = "RECOV   \(totR)"
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellView)
        contentView.addSubview(shadowView)
        contentView.addSubview(provLabel)
        contentView.addSubview(totalCasesLabel)
        contentView.addSubview(activeCasesLabel)
        contentView.addSubview(totalDeaths)
        contentView.addSubview(totalRecovered)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


