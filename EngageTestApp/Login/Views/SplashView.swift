//
//  SplashView.swift
//  EngageTestApp
//
//  Created by Jeff Cedilla on 11/26/17.
//  Copyright © 2017 EngageFT. All rights reserved.
//

import UIKit

class SplashView: UIView {

    var labelYConstraint: NSLayoutConstraint!
    
    let image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "hands")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let blackLayer : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.3
        return view
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "Become a customer today"
        
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.light)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button : UIButton = {
       let button = UIButton(type: UIButtonType.roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.custom.teal
        button.setTitle("Open an Account", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.light)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

// MARK: - Setup UI
extension SplashView {
    
    private func setupView() {
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(image)
        addSubview(blackLayer)
        addSubview(label)
        addSubview(button)
        
        image.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        image.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        blackLayer.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        blackLayer.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        blackLayer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blackLayer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        labelYConstraint = label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -37)
        labelYConstraint.isActive = true
        
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        
        
    }
    
}
