//
//  FeedOfferGeneralizeSearchDataProvider.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

final class FeedOfferGeneralizeSearchDataProvider: NSObject, CollectionViewDataProvider {
    // MARK: - Output

    var onItemSelected: ((IndexPath) -> Void)?

    // MARK: - Members

    private let cellDataProvider: GeneralizeSearchCellDataProvider

    // MARK: - Interface

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FeedHeaderGeneralizeSearchViewCell = collectionView.dequeueReusableCell(at: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.3176470588, green: 0.5058823529, blue: 0.7215686275, alpha: 1)

        let model = getModel(at: indexPath)
        cell.setup(with: model)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = cellDataProvider.width(for: indexPath)

        return CGSize(width: width, height: 32)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onItemSelected?(indexPath)
    }

    // MARK: - Helpers

    private func getModel(at indexPath: IndexPath) -> String {
        return cellDataProvider.title(for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellDataProvider.itemsCount()
    }

    // MARK: - Init

    init(cellDataProvider: GeneralizeSearchCellDataProvider) {
        self.cellDataProvider = cellDataProvider
        super.init()
    }
}
