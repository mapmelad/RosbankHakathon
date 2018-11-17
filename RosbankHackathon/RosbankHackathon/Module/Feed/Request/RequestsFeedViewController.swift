//
//  RequestsFeedViewController.swift
//  RosbankHackathon
//
//  Created by Semyon on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

final class RequestsFeedViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet
    private var requestCollection: UICollectionView!

    // MARK: - Members

    private let storiesProvider: FeedStoriesDataProvider = {
        let provider = FeedStoriesDataProvider()

        return provider
    }()

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        registerCells()
        requestCollection.register(FeedHeaderViewImp.self, forSupplementaryViewOfKind: .header)
    }

    private func registerCells() {
        let ticketsCell = UINib(nibName: "RequestsCollectionViewCell", bundle: nil)
        requestCollection.register(ticketsCell, forCellWithReuseIdentifier: "RequestsCollectionViewCell")
    }
}

extension RequestsFeedViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RequestsCollectionViewCell = collectionView.dequeueReusableCell(at: indexPath)

        return cell
    }
}

extension RequestsFeedViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: screenWidth, height: 120)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 238)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header: FeedHeaderViewImp = collectionView.dequeueReusableView(of: .header, at: indexPath)
            header.setup(with: "Запросы", collectionViewDataProvider: storiesProvider)

            return header
        }
        assertionFailure()
        return UICollectionReusableView()
    }
}
