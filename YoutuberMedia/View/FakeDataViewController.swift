//
//  FakeDataViewController.swift
//  YoutuberMedia
//
//  Created by Kay Chang on 2021/4/17.
//

import UIKit

class FakeDataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = FakeDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

private extension FakeDataViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

extension FakeDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getDatas().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(MediaDataCell.self)") as? MediaDataCell else { return UITableViewCell() }
        cell.setupCell(mediaData: viewModel.getDatas()[indexPath.row])
        return cell
    }
}
