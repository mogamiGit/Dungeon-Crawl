//
//  CustomNotes.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 5/12/23.
//

import SwiftUI

struct CustomNotes: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.bold)
            VStack(alignment: .leading) {
                Text(description)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(20)
            .background() {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1.0)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    CustomNotes(title: "Notes", description: "Lorem ipsum dolor")
}
