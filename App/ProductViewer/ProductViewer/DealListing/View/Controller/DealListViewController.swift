//
//  Copyright © 2022 Target. All rights reserved.
//

import UIKit

final class DealListViewController: UITableViewController {
    var presenter: DealListPresenterProtocol?
    private var listViewModels: DealsListViewModel?
    private let imageProvider: ImageProviderProtocol
    
    private lazy var loadingIndicatorView = LoadingIndicatorView(frame: view.frame)
    
    init(imageProvider: ImageProviderProtocol) {
        self.imageProvider = imageProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        setupLoadingIndicator()
        presenter?.onViewDidLoad()
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 172
        tableView.register(DealViewCell.self, forCellReuseIdentifier: DealViewCell.reuseIdentifier)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.addBottomBorder(with: .grayLight, height: 1.0)
        navigationItem.hidesBackButton = true
        navigationItem.title = "List"
    }
    
    private func setupLoadingIndicator() {
        view.addSubview(loadingIndicatorView)
        NSLayoutConstraint.activate([
            loadingIndicatorView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingIndicatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingIndicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingIndicatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension DealListViewController: DealListViewProtocol {
    func updateDealsList(_ listViewModels: DealsListViewModel?) {
        self.listViewModels = listViewModels
        self.tableView.reloadData()
    }
    
    func showErrorMessage(_ message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { [weak self] action in
            self?.presenter?.didTapOk()
        }))

        present(alert, animated: true, completion: nil)
    }
    
    func showLoadingIndicator() {
        loadingIndicatorView.showLoadingIndicator()
    }
    
    func hideLoadingIndicator() {
        loadingIndicatorView.hideLoadingIndicator()
    }
}

extension DealListViewController {
    // MARK: - Table View Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModels?.deals.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let deal = listViewModels?.deals[indexPath.row] else {
            return
        }
        presenter?.onDidSelectDeal(deal)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeDealCell(indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? DealViewCell else {
            return
        }
        cell.cancelImageDownload()
    }

    func makeDealCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DealViewCell.reuseIdentifier) as? DealViewCell else {
            return UITableViewCell()
        }
        cell.configure(listViewModels?.deals[indexPath.row], imageProvider)
        return cell
    }
}
