//
//  YoutubeListViewController.swift
//  YoutuberMedia
//
//  Created by Kay Chang on 2021/4/17.
//

import UIKit

/**
 Target:
 1. take data from api (Y)
 2. fetch more data (Y)
 3. click to watch video (Y)
 */

class YoutubeListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel: YoutubeListViewModel = YoutubeListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindData()
    }
}

private extension YoutubeListViewController {
    func setupTableView() {
        let cellNib = UINib(nibName: "\(YoutubeDataCell.self)", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "\(YoutubeDataCell.self)")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    func bindData() {
        reloadData(refersh: true)
    }
    
    func reloadData(refersh: Bool = false) {
        viewModel.fetchData(refresh: refersh) {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        } errorHandler: { errorMessage in
            print(errorMessage)
        }
    }
}

extension YoutubeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.medias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(YoutubeDataCell.classForCoder())", for: indexPath) as? YoutubeDataCell, viewModel.medias.count > 0 else { return UITableViewCell() }
        // 當行數==當前資料筆數-2時，繼續抓取新資料
        let data = viewModel.medias[indexPath.row]
        if indexPath.row == viewModel.medias.count - 2 {
            reloadData()
        }
        cell.setupCell(item: data)
        return cell
    }
}

extension YoutubeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard viewModel.medias.count > indexPath.row else { return }
        let mediaID = viewModel.medias[indexPath.row].id
        guard let url = URL(string: "https://www.youtube.com/watch?v=\(mediaID)") else { return }
        displayEmbedSafariViewController(url: url)
    }
}
