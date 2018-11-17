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
        cell.backgroundColor = #colorLiteral(red: 0.2389388382, green: 0.5892125368, blue: 0.8818323016, alpha: 1)
        cell.onTap = { [weak self] in
            self?.onTap?()
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
}
