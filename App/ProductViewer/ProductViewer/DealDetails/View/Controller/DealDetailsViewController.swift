//
//  DealDetailsViewController.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class DealDetailsViewController: UIViewController {
    private lazy var detailsView = DealDetailsView()
    private lazy var loadingIndicatorView = UIView()
    private lazy var loadingIndicator = UIActivityIndicatorView(style: .medium)

    var presenter: DealDetailsPresenterProtocol?
    
    private var viewModel: DealDetailsViewModel?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLoadingIndicator()
        presenter?.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    deinit {
        detailsView.cancelImageDownload()
    }
}

private extension DealDetailsViewController {
    @objc func didTapBack() {
        presenter?.didTapBack()
    }

    func setupViews() {
        view.backgroundColor = .white

        view.addSubview(detailsView)
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            detailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.barStyle = .default
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = .backButton(self, action: #selector(didTapBack))
        navigationItem.title = "Detail"
    }
      
    func setupLoadingIndicator() {
        loadingIndicatorView.frame = view.frame
        loadingIndicatorView.backgroundColor = .white
        loadingIndicatorView.isHidden = true
            
        setupSpinner()
    }
      
    func setupSpinner() {
        loadingIndicator.center = CGPoint(
            x: UIScreen.main.bounds.size.width / 2,
            y: UIScreen.main.bounds.size.height / 2
        )
        loadingIndicator.hidesWhenStopped = true
        loadingIndicatorView.addSubview(loadingIndicator)
        view.addSubview(loadingIndicatorView)
    }
}

extension DealDetailsViewController: DealDetailsViewProtocol {
    func updateView(_ dealDetails: DealDetailsViewModel) {
        self.viewModel = dealDetails
        self.detailsView.configure(dealDetails)
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
        DispatchQueue.main.async {
            self.loadingIndicator.startAnimating()
            self.loadingIndicatorView.isHidden = false
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
            self.loadingIndicatorView.isHidden = true
        }
    }
}
