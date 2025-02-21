//
//  ImageGridViewController.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import UIKit
import Combine
import NetworkingModule

public class ImageGridViewController: UIViewController {
    public weak var coordinator: ImageGridCoordinator?
    
    private var collectionView: UICollectionView!
    private let viewModel: ImageGridViewModel
    private var dataSource: UICollectionViewDiffableDataSource<Int, PhotoUIModel>!
    private var cancellables = Set<AnyCancellable>()
    
    public init(viewModel: ImageGridViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        setupDataSource()
        setupBindings()
        
        Task { await viewModel.fetchImages() }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        titleLabel.text = "LumX"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        navigationItem.titleView = titleLabel
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { _, _ -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(180)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(180)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        }
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, PhotoUIModel>(
            collectionView: collectionView
        ) { (collectionView, indexPath, photo) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseIdentifier, for: indexPath) as! ImageCell
            let viewModel = ImageCellViewModel(photo: photo, service: UnsplashNetworkServiceImpl()) // TODO: DI
            cell.configure(with: viewModel)
            return cell
        }

        collectionView.dataSource = dataSource
    }
    
    private func setupBindings() {
        viewModel.reloadPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.updateCollectionView()
            }
            .store(in: &cancellables)
        
        viewModel.$errorMessage
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                self?.showErrorAlert(message: errorMessage)
            }
            .store(in: &cancellables)
    }

    private func updateCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoUIModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.photos, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - UICollectionView Delegate
extension ImageGridViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPhotoID = viewModel.photos[indexPath.item].id
        coordinator?.showDetail(for: selectedPhotoID)
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let thresholdIndex = viewModel.photos.count - 12
        if indexPath.item == thresholdIndex {
            Task { await viewModel.fetchImages() }
        }
    }
}
