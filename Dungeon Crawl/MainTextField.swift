//
//  MainTextField.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 7/10/23.
//

import SwiftUI

struct MainTextField: View {
    let titleKey: String
    let binding: Binding<String>
    let prompt: String
    
    var body: some View {
        TextField(titleKey, text:binding, prompt: Text(prompt).foregroundStyle(.gray))
            .disableAutocorrection(true)
            .padding()
            .foregroundStyle(.white)
            .background() {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white).opacity(0.1)
            }
    }
}

//#Preview {
//    MainTextField()
//}
