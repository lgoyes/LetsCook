//
//  RecipeListViewController.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol RecipeListViewType: BaseViewType {
    
}

final class RecipeListViewController: BaseViewController<RecipeListPresenterType> {
    
    private var content: RecipeListUIViewType {
        return self.view as! RecipeListUIViewType
    }
    
    override func loadView() {
        view = RecipeListView()
    }
}
