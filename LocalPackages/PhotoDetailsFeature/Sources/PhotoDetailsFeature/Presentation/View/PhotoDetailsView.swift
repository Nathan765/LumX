//
//  PhotoDetailsView.swift
//  PhotoDetailsFeature
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import SwiftUI

public struct PhotoDetailsView: View {
    @ObservedObject var viewModel: PhotoDetailsViewModel
    
    public init(viewModel: PhotoDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.photoURL)) { image in
                image.resizable()
                     .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text(viewModel.descriptionText)
                .padding()
                .multilineTextAlignment(.center)
        }
        .navigationTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
