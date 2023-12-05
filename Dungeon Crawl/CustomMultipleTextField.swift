//
//  CustomMultipleTextField.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 15/10/23.
//

import SwiftUI

struct CustomMultipleTextField: View {
    var title: String
    var titleKey: String
    var promptText: String
    var binding: Binding<String>
    var description: String?
    
    init(title: String, titleKey: String, promptText: String, binding: Binding<String>, description: String? = nil) {
        self.title = title
        self.titleKey = titleKey
        self.promptText = promptText
        self.description = description
        self.binding = binding
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .fontWeight(.bold)
            if let description {
                Text(description)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            TextField(titleKey, text:binding, prompt: Text(promptText).foregroundStyle(.gray), axis: .vertical)
                .lineLimit(3, reservesSpace: true)
                .disableAutocorrection(true)
                .padding()
                .foregroundStyle(.white)
                .background() {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white).opacity(0.1)
                }
        }
    }
}

//#Preview {
//    CustomMultipleTextField()
//}
