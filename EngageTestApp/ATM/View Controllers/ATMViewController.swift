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
    
    let loadingSpinner : UIActivityIndicatorView = {
       let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.isHidden = true
        return spinner
    }()
    
    var splashViewHeightAnchor: NSLayoutConstraint!
    
    let networking = ATMNetworking.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


    



}

//MARK: - Setup view
extension ATMViewController {
    
    private func setupDelegates() {
        splashView.button.addTarget(self, action: #selector(clickedSearch), for: .touchUpInside)
        networking.networkingDelegate = self
    }
    
    private func setupView() {
        setupDelegates()
        view.backgroundColor = UIColor.white
        
        splashView.image.image = UIImage(named: "atm")
        splashView.label.text = "Find an ATM"
        splashView.button.setTitle("Search", for: .normal)
        
        view.addSubview(splashView)
        
        
        splashView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        splashView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        splashView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
//        splashView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        splashViewHeightAnchor = splashView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1)
        splashViewHeightAnchor.isActive = true
        
        setCollectionViewConstraints()
        
        
    }
    
    private func setCollectionViewConstraints() {
        view.addSubview(collectionView)
        
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: splashView.bottomAnchor, constant: 8).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func addSpinner() {
        loadingSpinner.startAnimating()
        
        
        view.addSubview(loadingSpinner)
        
        loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingSpinner.topAnchor.constraint(equalTo: splashView.label.bottomAnchor, constant: 12).isActive = true
    }
    
    @objc func clickedSearch() {
        
        splashView.label.text = "Finding ATMs..."
        
        UIView.animate(withDuration: 1, animations: {
            self.splashView.button.alpha = 0
        }) { (_) in
            self.splashView.button.isHidden = true
            self.addSpinner()
        }
        
        networking.callEndpoint()
        
        
    }
    
}

// MARK: - ATMNetworking Delegate
// Receives list of ATM objects and animates the view
extension ATMViewController : ATMNetworkingDelegate {
    func didReceiveATMs(atms: [ATM]) {
        
        DispatchQueue.main.async {
            
            self.loadingSpinner.removeFromSuperview()
            
            self.collectionView.atms = atms
            self.collectionView.reloadData()
            
            // Shrink splash view size
            UIView.animate(withDuration: 0.75, animations: {
                self.splashViewHeightAnchor.isActive = false
                self.splashViewHeightAnchor = self.splashView.heightAnchor.constraint(equalToConstant: 150)
                self.splashViewHeightAnchor.isActive = true
                self.splashView.button.isHidden = true
                self.splashView.label.alpha = 0
                self.view.layoutIfNeeded()
            }, completion: { (_) in
                self.splashView.label.alpha = 1
                self.splashView.label.text = "ATM Locations"
                
                // Animate smaller splash view. Center text and increase its scale
                UIView.animate(withDuration: 0.5, animations: {
                    self.splashView.labelYConstraint.isActive = false
                    self.splashView.labelYConstraint = self.splashView.label.centerYAnchor.constraint(equalTo: self.splashView.centerYAnchor, constant: 0)
                    self.splashView.labelYConstraint.isActive = true
                    self.splashView.layoutIfNeeded()
                    
                    
                }, completion: { (_) in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.splashView.label.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                    })
                    
                })
                
            })

        }
        
        
    }
    
    
}
