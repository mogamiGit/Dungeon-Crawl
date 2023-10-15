//
//  CarouselClasses.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 8/10/23.
//

import SwiftUI

struct CarouselClasses: View {
    @State var vm = CreatePlayerViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Select Class")
                .padding(.horizontal, 30)
                .foregroundStyle(.white)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(ClassType.allCases, id: \.self) { option in
                        VStack {
                            getTypeImage(playerClass:option)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                            Text(option.rawValue)
                                .font(.title2)
                        }
                        .padding()
                        .foregroundStyle(.white)
                        .frame(width: 300)
                        .background() {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(vm.playerClassType == option ? Color.mainDungeon : .black)
                        }
                        .onTapGesture {
                            print(option)
                            self.vm.playerClassType = option
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 30)
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
