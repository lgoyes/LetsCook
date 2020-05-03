//
//  RecipeListView.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

protocol RecipeListUIViewType {
    
}

final class RecipeListView: UIView, RecipeListUIViewType {
    
    lazy var tableView: RecipeTableView = {
        let tableView = RecipeTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        return tableView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isHidden = false
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        self.addSubview(tableView)
        self.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            
            activityIndicator.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    func showTable() {
        tableView.isHidden = false
        activityIndicator.isHidden = true
    }
}
