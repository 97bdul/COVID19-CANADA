//
//  topCell.swift
//  Covid19 in CA
//
//  topCell
//  Created by Abdul R on 2021-03-31.
//

import UIKit
import Foundation

struct topConstanats {

    static let cellCornerRadius: CGFloat = 10
    
    static let dataLabelCR: CGFloat = 10
}

class topCell: UICollectionViewCell {
    
    static let identifier = "topCell"
    
    private let cellView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bodyText : UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.isSelectable = false
        textView.textColor = .label
        textView.font = UIFont.rounded(ofSize: 16.5, weight: .regular)
        textView.textAlignment = .left
        
        return textView
    }()
    
    private let footerLink: UILabel = {
        
        let label = UILabel()
        let link  = "tap"
        label.propLabel(fontSize: 12, fontWeight: .semibold, textColor: .gray, textAlignment: .right, Backgroundcolor: .clear, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        label.text = "View full story"
        label.font = UIFont.italicSystemFont(ofSize: 12)
        
        
        return label
    }()
    
    private let newsImage: UIImageView = {
        let imgV = UIImageView()
        imgV.image = #imageLiteral(resourceName: "Rese")
        imgV.contentMode = .scaleAspectFill
        imgV.layer.masksToBounds = false
        imgV.clipsToBounds = true
        imgV.layer.cornerRadius = 5
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.backgroundColor = .clear
        return imgV
    }()
    
    override func layoutSubviews() {
        
        
        shadowView.applyshadowWithCorner(containerView: cellView, cornerRadious: topConstanats.cellCornerRadius, color: #colorLiteral(red: 0.8671220974, green: 0.8671220974, blue: 0.8671220974, alpha: 1))
        
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        cellView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        newsImage.topAnchor.constraint(equalTo: cellView.topAnchor,constant: 10).isActive = true
        newsImage.widthAnchor.constraint(equalToConstant: 95).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        newsImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10).isActive = true
        
        bodyText.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        bodyText.widthAnchor.constraint(equalToConstant: 225).isActive = true
        bodyText.heightAnchor.constraint(equalToConstant: 110).isActive = true
        bodyText.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10).isActive = true
        
        footerLink.bottomAnchor.constraint(equalTo: cellView.bottomAnchor,constant: -5).isActive = true
        footerLink.widthAnchor.constraint(equalTo: cellView.widthAnchor, constant: -150).isActive = true
        footerLink.heightAnchor.constraint(equalToConstant: 20).isActive = true
        footerLink.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -15).isActive = true
        
    }
    
    public func configureCell(bodytext:String) {
        
        bodyText.text = bodytext
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellView)
        contentView.addSubview(footerLink)
        contentView.addSubview(newsImage)
        contentView.addSubview(bodyText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


