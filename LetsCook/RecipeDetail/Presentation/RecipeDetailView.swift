//
//  RecipeDetailView.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

protocol RecipeDetailUIViewType {
    func setTitle(_ text: String)
    func setRating(_ number: Int)
    func setInstructions(_ text: String)
}

final class RecipeDetailView: UIView {
    struct Constants {
        static let margins = UIEdgeInsets(
            top: 0,
            left: 20,
            bottom: 0,
            right: 20)
        static let numberOfRatingStars = 5
        static let ratingStarHeight = CGFloat(30)
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    var ratingStarsCollection: [UIImageView] = []
    
    lazy var ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: Constants.ratingStarHeight)
        ])
        return stackView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        prepareSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareSubviews() {
        prepareScrollView()
        prepareStackView()
        prepareTitleLabel()
        prepareRatingStack()
        prepareInstructionsLabel()
    }
    
    func prepareScrollView() {
        self.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: Constants.margins.top),
            scrollView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -Constants.margins.bottom),
            scrollView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: Constants.margins.left),
            scrollView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -Constants.margins.right)
        ])
    }
    
    func prepareStackView() {
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        ])
    }
    
    func prepareTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
    }
    
    func prepareRatingStack() {
        stackView.addArrangedSubview(ratingStackView)
        for _ in 0..<Constants.numberOfRatingStars {
            let newStarImage = createNewStarImage()
            ratingStarsCollection.append(newStarImage)
            ratingStackView.addArrangedSubview(newStarImage)
            adjustStarImageConstraints(newStarImage)
        }
    }
    
    func createNewStarImage() -> UIImageView {
        let newStarImage = UIImageView()
        newStarImage.translatesAutoresizingMaskIntoConstraints = false
        return newStarImage
    }
    
    func adjustStarImageConstraints(_ newStarImage: UIImageView) {
        NSLayoutConstraint.activate([
            newStarImage.widthAnchor.constraint(equalTo: ratingStackView.widthAnchor, multiplier: 1/CGFloat(Constants.numberOfRatingStars))
        ])
    }
    
    func prepareInstructionsLabel() {
        self.stackView.addArrangedSubview(instructionsLabel)
    }
}

extension RecipeDetailView: RecipeDetailUIViewType {
    func setInstructions(_ text: String) {
        self.instructionsLabel.text = text
    }
    
    func setTitle(_ text: String) {
        self.titleLabel.text = text
    }
    
    func setRating(_ number: Int) {
        for (index, ratingStar) in ratingStarsCollection.enumerated() {
            if index < number {
                ratingStar.image = #imageLiteral(resourceName: "fill_star")
            } else {
                ratingStar.image = #imageLiteral(resourceName: "unfilled_star")
            }
        }
    }
}
