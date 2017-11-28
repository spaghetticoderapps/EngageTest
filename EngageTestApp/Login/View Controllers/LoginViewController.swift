//
//  LoginViewController.swift
//  EngageTestApp
//
//  Created by Jeff Cedilla on 11/26/17.
//  Copyright © 2017 EngageFT. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let splashView = SplashView()
    
    let customInputView = InputView()
    
    let tableView = AssistanceTableView()

    let label : UILabel = {
        let label = UILabel()
        label.text = "BBVA Compass is a trade name of Compass Bank, Member FDIC and Equal Housing Lender."
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.light)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


}


// MARK: Setup UI
extension LoginViewController {
    
    private func setupNav() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationItem.title = "Welcome to BBVA Compass"
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.custom.blue]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setDelegates() {
        customInputView.usernameTextView.delegate = self
        customInputView.passwordTextView.delegate = self
        customInputView.delegate = self
        
    }
    
    private func setupView() {
        setupNav()
        setDelegates()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(splashView)
        view.addSubview(customInputView)
        view.addSubview(tableView)
        view.addSubview(label)
        
        splashView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        splashView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        splashView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        splashView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        customInputView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        customInputView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        customInputView.topAnchor.constraint(equalTo: splashView.bottomAnchor).isActive = true
        customInputView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: customInputView.bottomAnchor, constant: 20).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
}

//MARK: - Textview delegates
extension LoginViewController : UITextViewDelegate {
    
    // Placeholder text clear
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        
    }
    
    //Dismisses keyboard when hitting return
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        if(text == "\n")
        {
            view.endEditing(true)
            return false
        }
        else
        {
            return true
        }
    }
    
}

// MARK: - Input Delegate
extension LoginViewController : InputDelegate {
    func clickedSubmit() {
        navigationController?.pushViewController(ATMViewController(), animated: true)
    }
    
    
}
