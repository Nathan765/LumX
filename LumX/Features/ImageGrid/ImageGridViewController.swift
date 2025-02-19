//
//  ImageGridViewController.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import SwiftUI

class ImageGridViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let viewModel: ImageGridViewModel
    private let coordinator: ImageGridCoordinator
    private var dataSource: UICollectionViewDiffableDataSource<Int, Photo>!
    
    init(viewModel: ImageGridViewModel, coordinator: ImageGridCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCollectionView()
        setupDataSource()
        setupBindings()
        viewModel.fetchImages()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Accueil"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { _, _ -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(180) // Hauteur fixe
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(180) // Même hauteur pour tous
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item]) // 2 colonnes
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            return section
        }
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.reuseIdentifier)
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Photo>(
            collectionView: collectionView
        ) { (collectionView, indexPath, photo) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseIdentifier, for: indexPath) as! ImageCell
            cell.configure(with: photo.urls.small)
            return cell
        }
        
        collectionView.dataSource = dataSource
    }
    
    private func setupBindings() {
        viewModel.onImagesUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.updateCollectionView()
            }
        }
    }

    private func updateCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Photo>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.photos)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UICollectionView Delegate
extension ImageGridViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPhoto = viewModel.photos[indexPath.item]
        coordinator.showDetail(for: selectedPhoto)
    }
}
