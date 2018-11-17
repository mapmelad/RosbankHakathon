//
//  RequestsFeedViewController.swift
//  RosbankHackathon
//
//  Created by Semyon on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

// ==

enum CategoryKind {
    case none

    var stringValue: String {
        switch self {
        case .none:
            return "none"
        }
    }
}

enum AchievementKind {
    case none

    var icon: UIImage? {
        switch self {
        case .none:
            return nil
        }
    }
}

struct RequestFeedModel {
    let name: String
    let confirmedDeals: Int
    let requestDescription: String
    let categories: [CategoryKind]
    let achievements: [AchievementKind]
    let deadline: Date
}

struct RequestFeedViewModel {
    let name: String
    let requestDescription: String
    let achievements: [UIImage]
    let categories: String
    let deadline: String
}

// ==

final class RequestFeedDataProvider {
    // MARK: - Interface

    func get() -> [RequestFeedViewModel] {
        let items = [RequestFeedViewModel(name: "Some name",
                                          requestDescription: "some descr",
                                          achievements: [],
                                          categories: "dasda",
                                          deadline: "25 nov.")]

        return items
    }
}

final class RequestsFeedViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet
    private var requestCollection: UICollectionView!

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

    private lazy var datasource: [RequestFeedViewModel] = {
        let provider = RequestFeedDataProvider()

        return provider.get()
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

    private func onStoryTap() {
        let main = UIStoryboard.init(name: "Main2", bundle: nil)
        let vc: StoriesViewController = main.instantiateViewController()
        present(vc, animated: true)
    }
}

extension RequestsFeedViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RequestsCollectionViewCell = collectionView.dequeueReusableCell(at: indexPath)
        let model = getModel(at: indexPath)
        cell.setup(with: model)

        return cell
    }

    private func getCell() -> RequestsCollectionViewCell {
        let nib = UINib(nibName: "RequestsCollectionViewCell", bundle: nil)
        let cell: RequestsCollectionViewCell = nib.instantiate(withOwner: self, options: nil)[0] as! RequestsCollectionViewCell

        return cell
    }

    private func getModel(at indexPath: IndexPath) -> RequestFeedViewModel {
        return datasource[indexPath.row]
    }
}

extension RequestsFeedViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width

        let cell = getCell()
        let model = getModel(at: indexPath)
        cell.setup(with: model)
        cell.layoutSubviews()

        return CGSize(width: screenWidth, height: cell.intrinsicContentSize.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 238)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header: FeedHeaderViewImp = collectionView.dequeueReusableView(of: .header, at: indexPath)
            header.setup(with: "Запросы", collectionViewDataProvider: storiesProvider)

            searchViewAccessory.frame.size = CGSize(width: collectionView.frame.width, height: 56)
            header.generalizeSearchView = searchViewAccessory
            header.onStoryTap = { [weak self] in
                self?.onStoryTap()
            }

            return header
        }
        assertionFailure()
        return UICollectionReusableView()
    }
}
