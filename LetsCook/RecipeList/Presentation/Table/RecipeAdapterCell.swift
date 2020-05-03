//
//  RecipeAdapterCell.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

final class RecipeAdapterCell: UITableViewCell {
    
    struct Constants {
        static let margin = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: RecipeAdapterCellViewModel) {
        self.label.text = data.title
    }
    
    func setConstraints() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.margin.top),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.margin.bottom),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.margin.left),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.margin.right)
        ])
    }
}
