//
//  FeedStoriesDataProvider.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

typealias CollectionViewDataProvider = (UICollectionViewDataSource & UICollectionViewDelegateFlowLayout)

final class FeedStoriesDataProvider: NSObject, CollectionViewDataProvider {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FeedStoryCell = collectionView.dequeueReusableCell(at: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.3176470588, green: 0.5058823529, blue: 0.7215686275, alpha: 1)

        return cell
    }
}
