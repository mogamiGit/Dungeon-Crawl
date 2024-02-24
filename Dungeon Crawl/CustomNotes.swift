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
        DisclosureGroup(title) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(description)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(10)
            }
            .padding(.top, 10)
        }
    }
}

#Preview {
    CustomNotes(title: "Notes", description: "Lorem ipsum dolor")
}
