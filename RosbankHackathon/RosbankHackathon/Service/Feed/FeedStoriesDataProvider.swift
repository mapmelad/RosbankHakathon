//
//  FeedStoriesDataProvider.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

final class FeedStoriesDataProvider: NSObject, CollectionViewDataProvider, FeedStoryCellOutput {
    var onTap: VoidBlock?

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FeedStoryCell = collectionView.dequeueReusableCell(at: indexPath)
        cell.onTap = { [weak self] in
            self?.onTap?()
        }
        if let image = images.item(at: indexPath.row) {
            cell.setup(with: image)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    // MARK: - Private

    private let images: [UIImage] = ["TinkovOleg", "ArtemiyLebedev",
                                     "SergeySobyanin", "VVPutin",
                                     "PVDurov", "magaTrump"].compactMap { UIImage(named: $0) }
}
