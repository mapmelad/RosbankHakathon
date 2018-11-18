//
//  FeedFilterController.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

final class FeedFilterController: UIViewController {
    // MARK: - Outlets

    @IBOutlet
    private var optionTable: UITableView!

    // MARK: - Members

    private let options: [String] = ["1", "2", "3"]

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    // MARK: - Methods

    private func setupTableView() {
        optionTable.delegate = self
        optionTable.dataSource = self
    }

    // MARK: - Actions

    @IBAction
    private func dismiss() {
        dismiss(animated: true)
    }
}

extension FeedFilterController: UITableViewDelegate {}

extension FeedFilterController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedFilterOptionCell = tableView.dequeueReusableCell(at: indexPath)
        let model = getModel(for: indexPath)
        cell.setup(with: model)

        return cell
    }

    // MARK: - Helpers

    private func getModel(for indexPath: IndexPath) -> String {
        return options[indexPath.row]
    }
}
