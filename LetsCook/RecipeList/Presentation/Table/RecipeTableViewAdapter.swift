//
//  RecipeTableViewAdapter.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

struct RecipeAdapterCellViewModel {
    let id: Int
    let title: String
}

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

final class RecipeTableViewAdapter<CellType: RecipeAdapterCell>: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var data: [RecipeAdapterCellViewModel] = []
    private let cellIdentifier: String = "RecipeAdapterCell"
    var tableView: UITableView?
    
    func attach(to tableView: UITableView) {
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RecipeAdapterCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func set(data: [Recipe]) {
        self.data = data.map({
            RecipeAdapterCellViewModel(id: $0.id, title: $0.title)
        })
        tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else {
            fatalError()
        }
        
        cell.configure(with: data[indexPath.row])
        
        return cell
    }
}
