//
//  RecipeTableViewAdapter.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

protocol RecipeTableViewAdapterDelegate: AnyObject {
    func tableViewAdapter(didSelectRecipe recipe: Recipe)
}

final class RecipeTableViewAdapter<CellType: RecipeAdapterCell>: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private let cellIdentifier: String = "RecipeAdapterCell"
    
    var data: [RecipeAdapterCellViewModel] = []
    var filterString: String = ""
    
    var tableView: UITableView?
    weak var delegate: RecipeTableViewAdapterDelegate?
    
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
        if filterString.isEmpty {
            return data.count
        } else {
            return data.filter({ $0.title.contains(filterString) }).count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else {
            fatalError()
        }
        
        let filteredData: [RecipeAdapterCellViewModel]
        if filterString.isEmpty {
            filteredData = data
        } else {
            filteredData = data.filter({ $0.title.contains(filterString) })
        }
        
        cell.configure(with: filteredData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = data[indexPath.row]
        let mappedRecipe = Recipe(id: recipe.id, title: recipe.title)
        delegate?.tableViewAdapter(didSelectRecipe: mappedRecipe)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setFilterString(_ filterString: String) {
        self.filterString = filterString
        tableView?.reloadData()
    }
}
