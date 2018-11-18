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

    private let searchProvider: FeedOfferGeneralizeSearchDataProvider = {
        let cellDataProvider = GeneralizeSearchCellDataProviderImp()
        let provider = FeedOfferGeneralizeSearchDataProvider(cellDataProvider: cellDataProvider)

        return provider
    }()

    private let apiClient: EPAPIClient = {
        let adapter = RequestAdapterImp(endpoint: "http://10.91.6.5:3000/")
        let sender = RequestSenderImp()
        let provider = ResponseProviderImp(adapter: adapter, sender: sender)
        let client = EPAPIClient(provider: provider)

        return client
    }()

    private lazy var searchViewAccessory: UIView = {
        let view = FeedHeaderGeneralizeSearchView(with: searchProvider)

        return view
    }()

    private var datasource: [RequestFeedViewModel] = {
        let provider: RequestFeedDataProvider = RequestFeedDataProviderImp()

        return provider.get()
    }()

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

        apiClient.getArray(method: .requestsGet, params: []) { (result: [RequestFeedModel]) in
            DispatchQueue.main.async {
                self.updateFeed(with: result)
            }
        }
    }

    private func updateFeed(with items: [RequestFeedModel]) {
        var cells = items.map { RequestFeedViewModel(model: $0) }
        let dummy = cells[0]
        cells.insert(dummy, at: 2)
        cells.insert(dummy, at: 5)

        datasource = cells
        requestCollection.reloadData()
    }

    private func setupCollectionView() {
        registerCells()
        requestCollection.register(FeedHeaderViewImp.self, forSupplementaryViewOfKind: .header)
        searchProvider.onItemSelected = { [weak self] _ in
            self?.onFilterTap()
        }
    }

    private func registerCells() {
        let ticketsCell = UINib(nibName: "RequestsCollectionViewCell", bundle: nil)
        requestCollection.register(ticketsCell, forCellWithReuseIdentifier: "RequestsCollectionViewCell")

        // [AwardStarsCell.self, AwardCollectionViewCell.self].forEach(requestCollection.register)

        let starsCellNib = UINib(nibName: "AwardStarsCell", bundle: nil)
        requestCollection.register(starsCellNib, forCellWithReuseIdentifier: "AwardStarsCell")

        let awardCollectionNib = UINib(nibName: "AwardCollectionViewCell", bundle: nil)
        requestCollection.register(awardCollectionNib, forCellWithReuseIdentifier: "AwardCollectionViewCell")
    }

    private func onStoryTap() {
        presentController(StoriesViewController.self)
    }

    private func onFilterTap() {
        presentController(FeedFilterController.self)
    }

    private func presentController<C: Reusable>(_ c: C.Type = C.self) {
        let main = UIStoryboard(name: "Main2", bundle: nil)
        let vc = main.instantiateViewController(ofType: c) as! UIViewController

        present(vc, animated: true)
    }

    private func pushController<C: Reusable>(_ c: C.Type = C.self) {
        let main = UIStoryboard(name: "Main2", bundle: nil)
        let vc = main.instantiateViewController(ofType: c) as! UIViewController

        navigationController?.pushViewController(vc, animated: true)
    }
}

extension RequestsFeedViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AwardStarsCell", for: indexPath)

            return cell
        }

        if indexPath.row == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AwardCollectionViewCell", for: indexPath)

            return cell
        }

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

        if indexPath.row == 2 {
            return CGSize(width: screenWidth, height: 187)
        }
        if indexPath.row == 5 {
            return CGSize(width: screenWidth, height: 111)
        }

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
