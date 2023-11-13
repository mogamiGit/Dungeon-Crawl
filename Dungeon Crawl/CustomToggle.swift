//
//  CustomToggleStyle.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 11/11/23.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .foregroundStyle(configuration.isOn ? Color.mainDungeon : .white.opacity(0.2))
                .frame(width: 50, height: 35, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Image(systemName: configuration.isOn ? "checkmark" : "xmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(Font.title.weight(.black))
                                .frame(width: 8, height: 8, alignment: .center)
                                .foregroundColor(configuration.isOn ? .green : .gray)
                        )
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                ).cornerRadius(20)
                .onTapGesture {
                    withAnimation(.linear(duration: 0.1)) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}
