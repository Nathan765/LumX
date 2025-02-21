//
//  ImageCell.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import UIKit
import NetworkingModule

class ImageCell: UICollectionViewCell {
    static let reuseIdentifier = "ImageCell"
    
    private var viewModel: ImageCellViewModel?

    private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: ImageCellViewModel) {
        self.viewModel = viewModel
        self.viewModel?.onImageUpdated = { [weak self] image in
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }
        self.viewModel?.loadImage()
    }
}
