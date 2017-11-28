//
//  InputView.swift
//  EngageTestApp
//
//  Created by Jeff Cedilla on 11/26/17.
//  Copyright © 2017 EngageFT. All rights reserved.
//

import UIKit

protocol InputDelegate {
    func clickedSubmit()
}

class InputView: UIView {

    var delegate: InputDelegate?
    
// MARK: - Declare UI Elements
    let usernameTextView : UITextView = {
        let textview = UITextView()
        textview.text = "Username"
        textview.textColor = UIColor.darkGray
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.layer.borderColor = UIColor.lightGray.cgColor
        textview.layer.borderWidth = 0.2
        textview.layer.cornerRadius = 3
        textview.clipsToBounds = true
        textview.font = UIFont.systemFont(ofSize: 16)
        return textview
    }()
    
    let passwordTextView : UITextView = {
        let textview = UITextView()
        textview.text = "Password"
        textview.textColor = UIColor.darkGray
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.layer.borderColor = UIColor.lightGray.cgColor
        textview.layer.borderWidth = 0.2
        textview.layer.cornerRadius = 3
        textview.clipsToBounds = true
        textview.font = UIFont.systemFont(ofSize: 16)
        return textview
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "Remember Username"
        
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let submitButton : UIButton = {
        let button = UIButton(type: UIButtonType.roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.custom.blue
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        button.layer.cornerRadius = 2
        button.clipsToBounds = true
        return button
    }()
    
    let forgotUserButton : UIButton = {
        let button = UIButton(type: UIButtonType.roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.setTitle("Forgot Username?", for: .normal)
        button.setTitleColor(UIColor.custom.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.semibold)
        button.layer.cornerRadius = 2
        button.clipsToBounds = true
        return button
    }()
    
    let forgotPassButton : UIButton = {
        let button = UIButton(type: UIButtonType.roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(UIColor.custom.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.semibold)
        button.layer.cornerRadius = 2
        button.clipsToBounds = true
        return button
    }()
    
    let usernameSwitch: UISwitch = {
       let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK: - Setup UI
extension InputView {
    
    private func setupView() {
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        
        submitButton.addTarget(self, action: #selector(clickedSubmit), for: .touchUpInside)
        
        addSubview(usernameTextView)
        addSubview(passwordTextView)
        addSubview(label)
        addSubview(usernameSwitch)
        addSubview(submitButton)
        addSubview(forgotUserButton)
        addSubview(forgotPassButton)
        
        usernameTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        usernameTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        usernameTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        usernameTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        passwordTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        passwordTextView.topAnchor.constraint(equalTo: usernameTextView.bottomAnchor, constant: 8).isActive = true
        passwordTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        label.topAnchor.constraint(equalTo: passwordTextView.bottomAnchor, constant: 12).isActive = true
        
        usernameSwitch.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        usernameSwitch.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        
        submitButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        submitButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        submitButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        forgotUserButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        forgotUserButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 8).isActive = true
        forgotUserButton.widthAnchor.constraint(equalTo: submitButton.widthAnchor, multiplier: 0.5).isActive = true
        forgotUserButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        forgotPassButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        forgotPassButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 8).isActive = true
        forgotPassButton.widthAnchor.constraint(equalTo: submitButton.widthAnchor, multiplier: 0.5).isActive = true
        forgotPassButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
}

// MARK: - Selectors
extension InputView {
    @objc func clickedSubmit() {
        delegate?.clickedSubmit()
    }
}
