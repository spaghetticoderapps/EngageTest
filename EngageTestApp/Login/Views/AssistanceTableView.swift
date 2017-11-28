//
//  AssistanceTableView.swift
//  EngageTestApp
//
//  Created by Jeff Cedilla on 11/26/17.
//  Copyright © 2017 EngageFT. All rights reserved.
//

import UIKit

class AssistanceTableViewCell : UITableViewCell {
    
    var icon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    
    
    var label : UILabel = {
        let label = UILabel()
        label.text = "Remember Username"
        
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.textColor = UIColor.custom.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup Cell UI
extension AssistanceTableViewCell {
    
    private func setupCell() {
        backgroundColor = UIColor.clear
        selectionStyle = .none
        
        addSubview(icon)
        addSubview(label)
        
        icon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        icon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        label.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 12).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12)
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
    }
    
}

class AssistanceTableView: UITableView {

    let identifier = "AssistanceTableViewCell"
    
    var nodes = [AssistanceNode]()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: CGRect.zero, style: style)
        seedData()
        setupView()
        
        register(AssistanceTableViewCell.self, forCellReuseIdentifier: identifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup Tableview
extension AssistanceTableView {
    
    private func seedData() {
        guard let location = UIImage(named: "location"),
            let question = UIImage(named: "question"),
            let enroll = UIImage(named: "enroll"),
            let plus = UIImage(named: "plus") else { return }
        nodes.append(AssistanceNode(image: location, title: "Find Us"))
        nodes.append(AssistanceNode(image: question, title: "Assistance Center"))
        nodes.append(AssistanceNode(image: enroll, title: "Enroll Now"))
        nodes.append(AssistanceNode(image: plus, title: "Feedback"))
    }
    
    private func setupView() {
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        isScrollEnabled = false
        
        
        
        delegate = self
        dataSource = self
        
    }
    
}

// MARK: - Tabkevuew datasource
extension AssistanceTableView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AssistanceTableViewCell
        
        cell.icon.image = nodes[indexPath.row].image
        cell.label.text = nodes[indexPath.row].title
        
        return cell
        
    }
    
    
}


// MARK: - Tableview Delegate
extension AssistanceTableView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
 
    // Change the highlight color of the row
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = cellForRow(at: indexPath) as! AssistanceTableViewCell
        
        UIView.animate(withDuration: 0.125, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            cell.backgroundColor = UIColor.custom.teal
        }) { (_) in
            UIView.animate(withDuration: 0.125, delay: 0, options: .curveEaseOut, animations: {
                cell.backgroundColor = UIColor.clear
            }, completion: nil)
        }
    }
    

    
}
