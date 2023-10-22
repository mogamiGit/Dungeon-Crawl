//
//  Styles.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 22/10/23.
//

import SwiftUI

struct DungeonMainButton: ButtonStyle {
    var isButtonEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        if isButtonEnabled {
            configuration.label
                .padding()
                .foregroundStyle(.white)
                .background {
                    Color.mainDungeon
                }
                .cornerRadius(10)
        } else {
            configuration.label
                .padding()
                .foregroundStyle(.white.opacity(0.4))
                .background {
                    Color.gray
                }
                .cornerRadius(10)
        }
    }
}
