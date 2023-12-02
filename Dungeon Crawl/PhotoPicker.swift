//
//  PhotoPicker.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 2/12/23.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: View {
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedPhotoData: Data?
    
    var body: some View {
        VStack {
            if selectedPhoto == nil {
                Circle()
                    .fill(.gray)
                    .frame(width: 150)
            } else {
                VStack(spacing: 10) {
                    if let selectedPhotoData, let uiImage = UIImage(data: selectedPhotoData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 150)
                            .clipShape(Circle())
                    }
                    Button(role: .destructive) {
                        withAnimation {
                            selectedPhoto = nil
                            selectedPhotoData = nil
                        }
                    } label: {
                        Label("Remove image", systemImage: "xmark")
                            .foregroundStyle(.red)
                    }
                }
            }
            
            PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                Label("Add image", systemImage: "photo")
            }
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                selectedPhotoData = data
            }
        }
    }
}

#Preview {
    PhotoPicker()
}
