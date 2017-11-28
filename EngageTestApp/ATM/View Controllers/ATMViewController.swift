//
//  ATMViewController.swift
//  EngageTestApp
//
//  Created by Jeff Cedilla on 11/27/17.
//  Copyright © 2017 EngageFT. All rights reserved.
//

import UIKit

class ATMViewController: UIViewController {

    let splashView = SplashView()
    
    let collectionView = ATMCollectionView()
    
    var splashViewHeightAnchor: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


    



}

//MARK: - Setup view
extension ATMViewController {
    
    private func setupDelegates() {
        splashView.button.addTarget(self, action: #selector(clickedSearch), for: .touchUpInside)
    }
    
    private func setupView() {
        setupDelegates()
        view.backgroundColor = UIColor.white
        
        splashView.image.image = UIImage(named: "atm")
        splashView.label.text = "Find an ATM"
        splashView.button.setTitle("Search", for: .normal)
        
        view.addSubview(splashView)
        view.addSubview(collectionView)
        
        splashView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        splashView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        splashView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
//        splashView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        splashViewHeightAnchor = splashView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1)
        splashViewHeightAnchor.isActive = true
        
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: splashView.bottomAnchor, constant: 8).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    @objc func clickedSearch() {
        
        UIView.animate(withDuration: 0.75) {
            self.splashViewHeightAnchor.isActive = false
            self.splashViewHeightAnchor = self.splashView.heightAnchor.constraint(equalToConstant: 150)
            self.splashViewHeightAnchor.isActive = true
            self.view.layoutIfNeeded()
        }
        
        
    }
    
}
