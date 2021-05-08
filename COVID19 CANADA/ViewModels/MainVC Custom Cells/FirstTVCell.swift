//
//  FirstTVCell.swift
//  COVID19 CANADA
//
//  Created by Abdul R on 2021-05-06.
//

import UIKit

class FirstTVCell: UITableViewCell {

    static let identifier = "FirstTVCell"
    
    private let leftView : UILabel = {
       let label = UILabel()
        label.text = "Fever"
        label.propLabel(fontSize: 17, fontWeight: .regular, textColor: .label, textAlignment: .left, Backgroundcolor: .clear, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    private let RightView : UILabel = {
        let label = UILabel()
        label.text = "Hell yeah"
        label.propLabel(fontSize: 16.5, fontWeight: .regular, textColor: .label, textAlignment: .right, Backgroundcolor: .clear, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        return label
    }()
    
    override func didAddSubview(_ subview: UIView) {
        
        contentView.addSubview(leftView)
        leftView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        leftView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -200).isActive = true
        leftView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        leftView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(RightView)
        RightView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        RightView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        RightView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        RightView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
