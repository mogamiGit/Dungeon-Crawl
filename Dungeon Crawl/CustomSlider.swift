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
    var limit: Double
    @State var isEditing = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .padding(.bottom, 5)
            Slider(value: .convert(from: binding), in: 0...limit, onEditingChanged: { editing in
                isEditing = editing
            })
            .tint(Color.mainDungeon)
            Text("\(number) / \(Int(limit))")
                .font(.title3)
                .foregroundStyle(isEditing ? Color.secondaryDungeon : .white)
        }
        .padding()
    }
}

//#Preview {
//    CustomSlider()
//}
