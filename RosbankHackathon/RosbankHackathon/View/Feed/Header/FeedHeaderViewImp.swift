//
//  FeedHeaderViewImp.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import UIKit

final class FeedHeaderGeneralizeSearchViewCell: UICollectionViewCell {
    // MARK: - Outlets

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Уточнить поиск"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = #colorLiteral(red: 0.926155746, green: 0.9410773516, blue: 0.9455420375, alpha: 1)

        return label
    }()

    // MARK: - Interface

    func setup(with model: String) {
        titleLabel.text = model
    }

    // MARK: - Setup

    override init(frame: CGRect) {
        super.init(frame: frame)
        internalInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        internalInit()
    }

    private func internalInit() {
        [titleLabel].forEach(contentView.addSubview)
        layer.cornerRadius = 4
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.pin.center().sizeToFit()
        contentView.pin.width(titleLabel.frame.width)
    }
}

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

final class FeedHeaderViewImp: UICollectionReusableView, HeaderView {
    // Output

    var onTextEnetered: ((String) -> Void)?

    var onStoryTap: VoidBlock?

    // MARK: - Members

    var generalizeSearchView: UIView? {
        didSet {
            searchBar.inputAccessoryView = generalizeSearchView
        }
    }

    private weak var dataProvider: (CollectionViewDataProvider & FeedStoryCellOutput)?

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

    private let separatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.7422102094, green: 0.764362216, blue: 0.7821244597, alpha: 1).withAlphaComponent(0.7)

        return separator
    }()

    // Methods

    func setup(with title: String, collectionViewDataProvider: (CollectionViewDataProvider & FeedStoryCellOutput)) {
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

    private func internalInit() {
        [titleLabel, searchBar,
         storiesTitleLabel, storiesSeeAllLabel,
         storyCollection, separatorView].forEach(addSubview)

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

    private func setupDataProvider(_ provider: (CollectionViewDataProvider & FeedStoryCellOutput)) {
        dataProvider = provider
        provider.onTap = { [weak self] in
            self?.onStoryTap?()
        }

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

        separatorView.pin.height(1).horizontally().bottom()
    }
}

extension FeedHeaderViewImp: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        onTextEnetered?(searchText)
    }
}
