//
//  ImageGridViewController.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import UIKit
import Combine
import NetworkingModule

public class ImageGridViewController: UIViewController {
    public weak var coordinator: ImageGridCoordinator?
    
    private let imageGridViewModel: ImageGridViewModel
    private let imageCellViewModelProvider: (PhotoUIModel) -> ImageCellViewModel
    
    private let gridView: ImageGridView
    private let delegate: ImageGridDelegate
    private var dataSource: UICollectionViewDiffableDataSource<Int, PhotoUIModel>!
    private var cancellables = Set<AnyCancellable>()
    
    public init(
        coordinator: ImageGridCoordinator?,
        imageGridViewModel: ImageGridViewModel,
        imageCellViewModelProvider: @escaping (PhotoUIModel) -> ImageCellViewModel
    ) {
        self.imageGridViewModel = imageGridViewModel
        self.imageCellViewModelProvider = imageCellViewModelProvider
        
        self.gridView = ImageGridView()
        self.delegate = ImageGridDelegate(viewModel: imageGridViewModel, coordinator: coordinator)
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = gridView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        self.setupDataSource()
        self.setupBindings()
        
        self.gridView.collectionView.delegate = self.delegate
        
        Task { await self.imageGridViewModel.fetchImages() }
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
    
    private func setupDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<Int, PhotoUIModel>(
            collectionView: self.gridView.collectionView
        ) { (collectionView, indexPath, photo) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseIdentifier, for: indexPath) as! ImageCell
            let viewModel = self.imageCellViewModelProvider(photo)
            
            cell.configure(with: viewModel)
            return cell
        }
        
        self.gridView.collectionView.dataSource = self.dataSource
    }
    
    private func setupBindings() {
        self.imageGridViewModel.reloadPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.updateCollectionView()
            }
            .store(in: &self.cancellables)
        
        self.imageGridViewModel.$errorMessage
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                self?.showErrorAlert(message: errorMessage)
            }
            .store(in: &self.cancellables)
    }

    private func updateCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoUIModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(self.imageGridViewModel.photos, toSection: 0)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
