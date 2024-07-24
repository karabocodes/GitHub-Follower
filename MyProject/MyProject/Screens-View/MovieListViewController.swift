// FollowerListViewController.swift
// MyProject

// Created by Nagarro on 2024/07/20.

import UIKit

class FollowerListViewController: UIViewController {

  // Enumeration to define sections for the collection view
  enum Section {
    case main
  }

  // Variables
  var movieName: String! // Username passed from SearchViewController
  var followers: [Follower] = [] // Array to store follower data

  // Collection view and data source properties
  var collectionView: UICollectionView!
  var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!

  override func viewDidLoad() {
    super.viewDidLoad()

    configureViewController()
    configureCollectionView()
    getFollowers()
    configureDataSource()
  }

  // Configure basic view controller properties
  func configureViewController() {
    view.backgroundColor = .systemBackground
    navigationController?.isNavigationBarHidden = false // Show navigation bar
    navigationController?.navigationBar.prefersLargeTitles = true // Enable large titles
  }

  // Configure collection view layout and add it to the view
  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view)) // Assuming UIHelper provides a three-column flow layout
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemBackground
    collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID) // Register the cell class
  }

  // Fetch follower data for the provided username
  func getFollowers() {
    NetworkManager.shared.getFollowers(for: movieName, page: 1) { [weak self] result in
      guard let self = self else { return } // Avoid optional chaining within the closure

      switch result {
      case .success(let followers):
        self.followers = followers
        self.updateData()

      case .failure(let error):
        self.presentGFAlertOnMainThread(title: "Bad stuff happend", message: error.rawValue, buttonTitle: "OK")
      }
    }
  }

  // Configure the collection view data source
  func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView) { (collectionView, indexPath, follower) -> UICollectionViewCell? in
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseID, for: indexPath) as! FollowerCollectionViewCell
      cell.set(follower: follower) // Set follower data in the cell
      return cell
    }
  }

  // Update the collection view with the fetched follower data
  func updateData() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
    snapshot.appendSections([.main])
    snapshot.appendItems(followers)
    DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
  }
}
