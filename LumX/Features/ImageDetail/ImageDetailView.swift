//
//  ImageDetailView.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import SwiftUI

struct ImageDetailView: View {
    @ObservedObject var viewModel: ImageDetailViewModel

    var body: some View {
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
        .navigationTitle("Image Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
