//
//  FeedHeaderViewImp.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import UIKit

final class FeedHeaderViewImp: UICollectionReusableView, HeaderView {
    // Output

    var onTextEnetered: ((String) -> Void)?

    // MARK: - Members

    private weak var dataProvider: CollectionViewDataProvider?

    // MARK: - Views

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Запросы"
        label.font = UIFont.systemFont(ofSize: 29, weight: .semibold)
        label.textColor = UIColor.black

        return label
    }()

    private lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.delegate = self
        bar.searchBarStyle = .minimal

        return bar
    }()

    private let storiesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Рекомендации"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black

        return label
    }()

    private let storiesSeeAllLabel: UILabel = {
        let label = UILabel()
        label.text = "См. все"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.textAlignment = .right

        return label
    }()

    private let storyCollection: UICollectionView = {
        let collection = UICollectionView(scrollDirection: .horizontal)
        let layout = collection.flowLayout!
        layout.itemSize = CGSize(width: 64, height: 64)

        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false

        collection.contentInset.left = 14
        collection.contentInset.right = collection.contentInset.left

        return collection
    }()

    // Methods

    func setup(with title: String, collectionViewDataProvider: CollectionViewDataProvider) {
        titleLabel.text = title
        setupDataProvider(collectionViewDataProvider)
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        internalInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        internalInit()
    }

    func internalInit() {
        [titleLabel, searchBar,
         storiesTitleLabel, storiesSeeAllLabel,
         storyCollection].forEach(addSubview)

        setupHeader()
        setupCollectionView()
    }

    private func setupHeader() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
    }

    private func setupCollectionView() {
        storyCollection.register(FeedStoryCell.self)
    }

    private func setupDataProvider(_ provider: CollectionViewDataProvider) {
        dataProvider = provider

        storyCollection.dataSource = provider
        storyCollection.delegate = provider

        storyCollection.reloadData()
    }

    // MARK: - Actions

    @objc
    private func handleTap() {
        endEditing(true)
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.pin.top(25).horizontally(15).sizeToFit(.width)
        searchBar.pin.below(of: titleLabel).marginTop(10).horizontally(6).sizeToFit(.width)

        storiesTitleLabel.pin.below(of: searchBar).marginTop(8).left(18).sizeToFit()
        storiesSeeAllLabel.pin.right(15).vCenter(to: storiesTitleLabel.edge.vCenter).sizeToFit()
        storyCollection.pin.height(64).below(of: storiesSeeAllLabel).marginTop(12).horizontally()

        print(storyCollection.frame.maxY)
    }
}

extension FeedHeaderViewImp: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        onTextEnetered?(searchText)
    }
}
