//
//  CarouselClasses.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 8/10/23.
//

import SwiftUI

struct CarouselClasses: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(ClassType.allCases, id: \.self) { c in
                        VStack {
                            getTypeImage(playerClass:c)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                            Text(c.rawValue)
                                .font(.title2)
                        }
                        .padding()
                        .foregroundStyle(Color.secondaryDungeon)
                        .frame(width: 320, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background() {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.black)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 40)
        }
    }
    
    func getTypeImage(playerClass: ClassType) -> Image {
        switch ClassType(rawValue: playerClass.rawValue) {
        case .barbarian:
            Image("barbarian")
        case .bard:
            Image("bard")
        case .cleric:
            Image("cleric")
        case .druid:
            Image("druid")
        case .fighter:
            Image("fighter")
        case .monk:
            Image("monk")
        case .paladin:
            Image("paladin")
        case .ranger:
            Image("ranger")
        case .rogue:
            Image("rogue")
        case .sorcerer:
            Image("sorcerer")
        case .warlock:
            Image("warlock")
        case .wizard:
            Image("wizard")
        case .none:
            Image(systemName: "circle")
        }
    }
}

#Preview {
    CarouselClasses()
}
