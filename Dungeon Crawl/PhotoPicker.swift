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
    @Binding var selectedPhotoData: Data?
    
    var body: some View {
        VStack {
            if selectedPhoto == nil {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(50)
                    .background(Color.gray)
                    .clipShape(Circle())
                    .frame(width: 150)
            } else {
                VStack(spacing: 30) {
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
                Image(systemName: "plus")
                    .padding()
                    .background(Color.accentDungeon)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
            }
            .offset(CGSize(width: 50, height: selectedPhoto == nil ? -50 : -100))
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                selectedPhotoData = data
            }
        }
    }
}

#Preview {
    PhotoPicker(selectedPhotoData: .constant(Data()))
}
