//
//  FeedHeaderGeneralizeSearchView.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

final class FeedHeaderGeneralizeSearchView: UIView {
    // MARK: - Outlets

    private let optionCollection: UICollectionView = {
        let collection = UICollectionView(scrollDirection: .horizontal)
        let layout = collection.flowLayout!

        layout.itemSize = CGSize(width: 72, height: 40)
        collection.contentInset.left = 12
        collection.contentInset.right = collection.contentInset.left

        collection.backgroundColor = #colorLiteral(red: 0.2265214622, green: 0.2928299606, blue: 0.5221264958, alpha: 1)
        collection.showsHorizontalScrollIndicator = false

        return collection
    }()

    // MARK: - Members

    private weak var dataProvider: CollectionViewDataProvider?

    // MARK: - Interface

    func setup(with dataProvider: CollectionViewDataProvider) {
        self.dataProvider = dataProvider

        optionCollection.dataSource = dataProvider
        optionCollection.delegate = dataProvider

        optionCollection.reloadData()
    }

    // MARK: - Init

    convenience init(with dataProvider: CollectionViewDataProvider) {
        self.init(frame: .zero)
        setup(with: dataProvider)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        internalInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        internalInit()
    }

    private func internalInit() {
        addSubview(optionCollection)
        setupCollectionView()
    }

    // MARK: - Methods

    private func setupCollectionView() {
        optionCollection.register(FeedHeaderGeneralizeSearchViewCell.self)
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        optionCollection.pin.all()
    }
}
