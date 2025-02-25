//
//  PhotoGalleryCell.swift
//  PhotoGalleryFeature
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import UIKit

class PhotoGalleryCell: UICollectionViewCell {
    static let reuseIdentifier = "PhotoGalleryCell"
    
    private var viewModel: PhotoGalleryCellViewModel?
    
    private lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(self.imageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configure(with viewModel: PhotoGalleryCellViewModel) {
        self.viewModel = viewModel
        self.viewModel?.onImageUpdated = { [weak self] image in
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }
        self.viewModel?.loadImage()
    }
}
