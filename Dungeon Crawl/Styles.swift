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

struct CustomToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(configuration.isOn ? Color.mainDungeon : .white.opacity(0.2))
                .frame(width: 70, height: 45, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Image(configuration.isOn ? "D20.fill" : "D20.empty")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, alignment: .center)
                                .foregroundColor(configuration.isOn ? Color.mainDungeon : .gray.opacity(0.8))
                        )
                        .offset(x: configuration.isOn ? 15 : -15, y: 0)
                )
                .onTapGesture {
                    withAnimation(.spring(duration: 0.2)) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}

struct SquareFlexibleModule<Content: View>: View {
    var useVStack: Bool
    var colorBackground: Color
    var content: () -> Content

    init(useVStack: Bool, colorBackground: Color, @ViewBuilder content: @escaping () -> Content) {
        self.useVStack = useVStack
        self.colorBackground = colorBackground
        self.content = content
    }

    var body: some View {
        if useVStack {
            return AnyView(VStack {
                content()
            }.padding(5)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 110)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(colorBackground)
                }
            )
        } else {
            return AnyView(HStack {
                content()
            }
                .padding(5)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 90)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(colorBackground)
                }
            )
        }
    }
}
