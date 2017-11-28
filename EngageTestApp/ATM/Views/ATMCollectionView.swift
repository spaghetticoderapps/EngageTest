//
//  ATMCollectionView.swift
//  EngageTestApp
//
//  Created by Jeff Cedilla on 11/27/17.
//  Copyright © 2017 EngageFT. All rights reserved.
//

import UIKit

class ATMCollectionViewCell : UICollectionViewCell {
    
    let landmark : UILabel = {
        let label = UILabel()
        label.text = "Landmark"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.custom.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let address : UILabel = {
        let label = UILabel()
        label.text = "446 Pasir Ris Drive 6 #01-112"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let plus : UILabel = {
        let label = UILabel()
        label.text = "+"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        label.textColor = UIColor.custom.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup Collection Cell
extension ATMCollectionViewCell {
    
    private func setupCell() {
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.custom.blue.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 5
        clipsToBounds = true
        
        addSubview(landmark)
        addSubview(plus)
        addSubview(address)
        
        landmark.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        landmark.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
        plus.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        plus.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        address.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        address.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
        
    }
    
}

class ATMCollectionView: UICollectionView {

    let identifier = "ATMCollectionViewCell"
    
    let flowLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup CollectionView
extension ATMCollectionView {
    
    private func setupCollectionView() {
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        
        dataSource = self
        delegate = self
        
        register(ATMCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
    
}

// MARK: - Collection View Data Source
extension ATMCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ATMCollectionViewCell
        return cell
    }
    
    
    
}

// MARK: - Collection View Delegate
extension ATMCollectionView : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = cellForItem(at: indexPath) as! ATMCollectionViewCell
        print(cell.address.text)
    }
    
}


// MARK: - Collection View Flow Layout
extension ATMCollectionView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 16, height: 75)
    }
    
}
