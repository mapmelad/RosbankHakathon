//
//  OfferController.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import UIKit

final class OfferFeedController: UIViewController {
    // MARK: - Outlets

    @IBOutlet
    private var feedCollection: UICollectionView!

    // MARK: - Members

    private let storiesProvider: FeedStoriesDataProvider = {
        let provider = FeedStoriesDataProvider()

        return provider
    }()

    private let searchProvider: FeedOfferGeneralizeSearchDataProvider = {
        let cellDataProvider = GeneralizeSearchCellDataProviderImp()
        let provider = FeedOfferGeneralizeSearchDataProvider(cellDataProvider: cellDataProvider)

        return provider
    }()

    private lazy var searchViewAccessory: UIView = {
        let view = FeedHeaderGeneralizeSearchView(with: searchProvider)

        return view
    }()

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    // MARK: - Methods

    private func setupCollectionView() {
        registerCells()
        feedCollection.register(FeedHeaderViewImp.self, forSupplementaryViewOfKind: .header)
    }

    private func registerCells() {
        let ticketsCell = UINib(nibName: "OfferCollectionViewCell", bundle: nil)
        feedCollection.register(ticketsCell, forCellWithReuseIdentifier: "OfferCollectionViewCell")
    }
}

extension OfferFeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
}

extension OfferFeedController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OfferCollectionViewCell = collectionView.dequeueReusableCell(at: indexPath)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 238)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header: FeedHeaderViewImp = collectionView.dequeueReusableView(of: .header, at: indexPath)
            header.setup(with: "Услуги", collectionViewDataProvider: storiesProvider)

            searchViewAccessory.frame.size = CGSize(width: collectionView.frame.width, height: 56)
            header.generalizeSearchView = searchViewAccessory

            return header
        }
        assertionFailure()
        return UICollectionReusableView()
    }
}
