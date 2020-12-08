//
//  FollowerListViewController.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 18/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

class FollowerListViewController: UIViewController {

    enum Section { case main }

    var username: String!
    var followers: [Follower] = []
    var page = 1
    var hasMoreFollowers = true

    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getFollowers(username: username,
                     page: page)
        configureDataSource()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false,
                                                     animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self,
                                forCellWithReuseIdentifier: FollowerCell.reuseID)
    }

    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
    }

    private func getFollowers(username: String, page: Int) {
        showLoadingView()
        NetworkManager.shared.getFollowers(username: username,
                                           page: page) { [weak self] result in
            guard let self = self else { return }

            self.dismissLoadingView()
            switch result {
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollowers = false }
                self.followers.append(contentsOf: followers)

                if self.followers.isEmpty {
                    let message = "This user doesn't have any followers. Go follow them 😉."
                    DispatchQueue.main.async {
                        self.showEmptyStateView(with: message,
                                                in: self.view)
                        return
                    }
                }
                self.updateData()
            case .failure(let errorMessage):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened",
                                                message: errorMessage.rawValue,
                                                buttonTitle: "OK")
            }
        }
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID,
                                                          for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }

    func updateData() {
        var snapshots = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshots.appendSections([.main])
        snapshots.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshots,
                                  animatingDifferences: true)
        }
    }
}

extension FollowerListViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            page += 1
            getFollowers(username: username,
                         page: page)
        }
    }
}

extension FollowerListViewController
