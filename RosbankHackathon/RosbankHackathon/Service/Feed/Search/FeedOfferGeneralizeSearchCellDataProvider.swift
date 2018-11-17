//
//  FeedOfferGeneralizeSearchCellDataProvider.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

protocol GeneralizeSearchCellDataProvider: class {
    func itemsCount() -> Int
    func title(for indexPath: IndexPath) -> String
    func width(for indexPath: IndexPath) -> CGFloat
}

final class GeneralizeSearchCellDataProviderImp: GeneralizeSearchCellDataProvider {
    // MARK: - Members

    private let titles = ["Уточнить поиск", "Some other title"]

    // MARK: - Interface

    func itemsCount() -> Int {
        return titles.count
    }

    func title(for indexPath: IndexPath) -> String {
        return getModel(at: indexPath)
    }

    func width(for indexPath: IndexPath) -> CGFloat {
        let cell = FeedHeaderGeneralizeSearchViewCell()
        let model = getModel(at: indexPath)
        cell.setup(with: model)
        cell.layoutSubviews()

        return cell.contentView.frame.width + 16
    }

    // MARK: - Helpers

    private func getModel(at indexPath: IndexPath) -> String {
        let item = titles.item(at: indexPath.row)

        return item ?? "default"
    }
}

extension Array {
    public func item(at index: Int) -> Element? {
        guard count > index else { return nil }

        return self[index]
    }
}
