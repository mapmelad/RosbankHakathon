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
        addSubviews(titleLabel, searchBar, storyCollection)
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
        storyCollection.pin.height(64).below(of: searchBar).marginTop(8).horizontally()
    }
}

extension FeedHeaderViewImp: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        onTextEnetered?(searchText)
    }
}
