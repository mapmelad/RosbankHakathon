//
//  Cell+Reuse.swift
//  RxMarket
//
//  Created by Evgeniy on 01.03.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import UIKit

public protocol Reusable: class {
    static var reuseID: String { get }
}

public enum CollectionViewReusableViewKind {
    case header
    case footer

    var stringValue: String {
        switch self {
        case .header:
            return UICollectionView.elementKindSectionHeader
        case .footer:
            return UICollectionView.elementKindSectionFooter
        }
    }
}

extension Reusable {
    public static var reuseID: String { return String(describing: self) }
}

extension UITableViewCell: Reusable {}

extension UICollectionViewCell: Reusable {}

extension UICollectionReusableView: Reusable {}

extension UIViewController: Reusable {}

public extension UITableView {
    public func register<T: Reusable>(_ cellClass: T.Type = T.self) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseID)
    }

    public func dequeueReusableCell<T: Reusable>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: cellType.reuseID, for: indexPath) as! T

        return cell
    }

    public func dequeueReusableHeader<T: Reusable>(ofType cellType: T.Type = T.self, for section: Int) -> T {
        let cell = dequeueReusableCell(withIdentifier: cellType.reuseID, for: IndexPath(row: 0, section: section)) as! T

        return cell
    }
}

public extension UICollectionView {
    public func register<T: Reusable>(_ cellClass: T.Type = T.self) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseID)
    }

    public func register<T: Reusable>(_ viewClass: T.Type = T.self, forSupplementaryViewOfKind kind: CollectionViewReusableViewKind) {
        register(viewClass, forSupplementaryViewOfKind: kind.stringValue, withReuseIdentifier: viewClass.reuseID)
    }

    public func dequeueReusableCell<T: Reusable>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as! T

        return cell
    }

    public func dequeueReusableView<T: Reusable>(ofType viewType: T.Type = T.self, of kind: CollectionViewReusableViewKind, at indexPath: IndexPath) -> T {
        let view = dequeueReusableSupplementaryView(ofKind: kind.stringValue, withReuseIdentifier: viewType.reuseID, for: indexPath)

        return view as! T
    }
}

public extension UIStoryboard {
    func instantiateViewController<T: Reusable>(ofType type: T.Type = T.self) -> T {
        guard let viewController = instantiateViewController(withIdentifier: type.reuseID) as? T else {
            fatalError()
        }
        return viewController
    }
}
