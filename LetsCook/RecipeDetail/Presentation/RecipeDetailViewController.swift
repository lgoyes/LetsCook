//
//  RecipeDetailViewController.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol RecipeDetailViewType: BaseViewType {
    func drawView(with recipeDetail: RecipeDetail)
}

final class RecipeDetailViewController: BaseViewController<RecipeDetailPresenterType> {
    
    private var content: RecipeListUIViewType {
        return self.view as! RecipeListUIViewType
    }
    
    override func viewDidLoad() {
        presenter.bind(view: self)
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = RecipeDetailView()
    }
}

extension RecipeDetailViewController: RecipeDetailViewType {
    func drawView(with recipeDetail: RecipeDetail) {
        guard let view = self.view as? RecipeDetailUIViewType else {
            fatalError("view was supposed to be RecipeDetailUIViewType")
        }
        view.setTitle(recipeDetail.title)
        view.setRating(recipeDetail.rating)
        view.setInstructions(recipeDetail.instructions)
    }
}
