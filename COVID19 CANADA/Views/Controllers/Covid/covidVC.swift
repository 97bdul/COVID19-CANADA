//
//  covidVC.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-03-28.
//

import UIKit

class covidVC: UIViewController {
    
    let vc1 = FirstCVC()
    let vc2 = SecondCVC()
    let vc3 = ThirdCVC()
    let vc4 = FourthCVC()
    
    var count = 0
    static let labelArr = ["Covid19","Symptoms","WHO Guide","Vaccine"]
    
    private let segmentedController: UISegmentedControl = {
        
        let seg = UISegmentedControl(items: covidVC.labelArr)
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.tintColor = .gray
        seg.addTarget(self, action:#selector(segAction(_:)), for: .valueChanged)
        seg.selectedSegmentIndex = 0
        return seg
    }()
    
    func gestureAdd(){
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftGesture(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleRightGesture(gesture:)))
        swipeLeft.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleLeftGesture(gesture:UISwipeGestureRecognizer){
        
    }
    
    @objc func handleRightGesture(gesture:UISwipeGestureRecognizer){
        
    }
    
    @objc func segAction(_ segmentedControll: UISegmentedControl){
        
        vc1.view.isHidden = true
        vc2.view.isHidden = true
        vc3.view.isHidden = true
        vc4.view.isHidden = true
        
        if segmentedControll.selectedSegmentIndex == 0 {
            vc1.view.isHidden = false
        }
        else if segmentedControll.selectedSegmentIndex == 1 {
            vc2.view.isHidden = false
        }
        else if segmentedControll.selectedSegmentIndex == 2 {
            vc3.view.isHidden = false
        }
        else {
            vc4.view.isHidden = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        view.addSubview(segmentedController)
        segmentedController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        segmentedController.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,constant: -20).isActive = true
        segmentedController.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        constraintAdd(vc: vc1, segmentedController: segmentedController)
        constraintAdd(vc: vc2, segmentedController: segmentedController)
        constraintAdd(vc: vc3, segmentedController: segmentedController)
        constraintAdd(vc: vc4, segmentedController: segmentedController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLoader(vc: vc1)
        viewLoader(vc: vc2)
        viewLoader(vc: vc3)
        viewLoader(vc: vc4)
        
        vc2.view.isHidden = true
        vc3.view.isHidden = true
        vc4.view.isHidden = true
        
        self.segmentedController.selectedSegmentIndex = 0
    }
}

extension UIViewController {
    func viewLoader(vc:UIViewController){
        addChild(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
    }
    func constraintAdd(vc:UIViewController, segmentedController:UISegmentedControl){
        vc.view.topAnchor.constraint(equalTo: segmentedController.bottomAnchor , constant: 10).isActive = true
        vc.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        vc.view.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        vc.view.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
    }
}

