//
//  FIrstCVC.swift
//  COVID19 CANADA
//
//  Created by Abdul R on 2021-05-04.
//

import UIKit

class FirstCVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 0.9842278361, green: 0.9843689799, blue: 0.992039144, alpha: 1)
        return v
    }()
    
    //
    private var myView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.895261954)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var myViewShadow : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //
    private var sympView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.895261954)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var sympViewShadow : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var tebView : UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.rowHeight = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //
    private var cureView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.895261954)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var cureViewShadow : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstTVCell.identifier, for: indexPath) as! FirstTVCell
        cell.backgroundColor = .clear
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(myView)
        myViewShadow.applyshadowWithCorner(containerView: myView, cornerRadious: 15, color: #colorLiteral(red: 0, green: 0.4784809947, blue: 0.9998757243, alpha: 0.2189956564))
        myView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        myView.widthAnchor.constraint(equalTo:scrollView.widthAnchor,constant: -35).isActive = true
        myView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        myView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        
        scrollView.addSubview(sympView)
        sympViewShadow.applyshadowWithCorner(containerView: sympView, cornerRadious: 15, color: #colorLiteral(red: 0, green: 0.4784809947, blue: 0.9998757243, alpha: 0.2189956564))
        sympView.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 20).isActive = true
        sympView.widthAnchor.constraint(equalTo:view.safeAreaLayoutGuide.widthAnchor,constant: -35).isActive = true
        sympView.heightAnchor.constraint(equalToConstant: 550).isActive = true
        sympView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        scrollView.addSubview(tebView)
        tebView.topAnchor.constraint(equalTo: sympView.topAnchor, constant: 10).isActive = true
        tebView.widthAnchor.constraint(equalTo: sympView.widthAnchor).isActive = true
        tebView.bottomAnchor.constraint(equalTo: sympView.bottomAnchor).isActive = true
        tebView.leadingAnchor.constraint(equalTo: sympView.leadingAnchor).isActive = true
        
        scrollView.addSubview(cureView)
        cureViewShadow.applyshadowWithCorner(containerView: cureView, cornerRadious: 15, color: #colorLiteral(red: 0, green: 0.4784809947, blue: 0.9998757243, alpha: 0.2189956564))
        cureView.topAnchor.constraint(equalTo: sympView.bottomAnchor, constant: 20).isActive = true
        cureView.widthAnchor.constraint(equalTo:view.safeAreaLayoutGuide.widthAnchor,constant: -35).isActive = true
        cureView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cureView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        tebView.backgroundColor = .clear
        tebView.dataSource = self
        tebView.delegate = self
        tebView.register(FirstTVCell.self, forCellReuseIdentifier: FirstTVCell.identifier)
    }
}

