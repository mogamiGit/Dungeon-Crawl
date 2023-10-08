//
//  CustomSlider.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 7/10/23.
//

import SwiftUI

struct CustomSlider: View {
    var binding: Binding<Int>
    var number: Int
    var title: String
    @State var isEditing = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .padding(.bottom, 5)
            Slider(value: .convert(from: binding), in: 0...20, onEditingChanged: { editing in
                isEditing = editing
            })
            .tint(.creamDungeon)
            Text("\(number) / 20")
                .font(.title3)
                .foregroundStyle(isEditing ? .creamDungeon : .white)
        }
        .padding()
    }
}

//#Preview {
//    CustomSlider()
//}
