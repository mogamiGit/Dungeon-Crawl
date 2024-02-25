//
//  DetailMonsterView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 20/2/24.
//

import SwiftUI

struct DetailMonsterView: View {
    @State var vm: DetailMonsterViewModel
    
    var body: some View {
        ZStack {
            Color.bgDungeon.ignoresSafeArea()
                if let monster = vm.monster {
                    ScrollView {
                        VStack(spacing: 40) {
                            VStack(spacing: 8) {
                                Text(monster.name)
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                            }
                            VStack(spacing: 10) {
                                HStack(spacing: 10) {
                                    SquareFlexibleModule(useVStack: true, colorBackground: Color.secondaryDungeon.opacity(0.1)) {
                                        Text("Type")
                                            .font(.caption)
                                        Text("\(monster.type)".capitalizedFirstLetter())
                                            .foregroundStyle(.creamDungeon)
                                    }
                                    SquareFlexibleModule(useVStack: true, colorBackground: Color.secondaryDungeon.opacity(0.1)) {
                                        Text("Size")
                                            .font(.caption)
                                        Text("\(monster.size)")
                                            .foregroundStyle(.creamDungeon)
                                    }
                                    SquareFlexibleModule(useVStack: true, colorBackground: Color.secondaryDungeon.opacity(0.1)) {
                                        Text("Alignment")
                                            .font(.caption)
                                        Text("\(monster.alignment)".capitalizedFirstLetter())
                                            .foregroundStyle(.orangeDungeon)
                                    }
                                }
                                VStack(spacing: 10) {
                                    Text("Movement")
                                        .font(.caption)
                                    HStack(spacing: 20) {
                                        VStack {
                                            Text("Walk")
                                                .font(.title3)
                                            Text("\(monster.speed.walk)")
                                                .font(.headline)
                                                .foregroundStyle(Color.secondaryDungeon)
                                        }
                                        if (monster.speed.swim) != "no swim" {
                                            VStack {
                                                Text("Swim")
                                                    .font(.title3)
                                                Text("\(monster.speed.swim)")
                                                    .font(.headline)
                                                    .foregroundStyle(Color.secondaryDungeon)
                                            }
                                        }
                                        if (monster.speed.burrow) != "no burrow" {
                                            VStack {
                                                Text("Burrow")
                                                    .font(.title3)
                                                Text("\(monster.speed.burrow)")
                                                    .font(.headline)
                                                    .foregroundStyle(Color.secondaryDungeon)
                                            }
                                        }
                                        if (monster.speed.climb) != "no climb" {
                                            VStack {
                                                Text("Climb")
                                                    .font(.title3)
                                                Text("\(monster.speed.climb)")
                                                    .font(.headline)
                                                    .foregroundStyle(Color.secondaryDungeon)
                                            }
                                        }
                                    }
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                }
                                .padding(20)
                                .background {
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .fill(Color.secondaryDungeon.opacity(0.1))
                                }
                            }
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Hit that!")
                                    .font(.title2)
                                VStack {
                                    HStack {
                                        SquareFlexibleModule(useVStack: true, colorBackground: Color.secondaryDungeon.opacity(0.1)) {
                                            Text("Hit points")
                                                .font(.caption)
                                            Text("\(monster.hitPoints)")
                                                .font(.headline)
                                                .foregroundStyle(Color.secondaryDungeon)
                                        }
                                        SquareFlexibleModule(useVStack: true, colorBackground: Color.accentDungeon.opacity(0.6)) {
                                            Text("Hit dice")
                                                .font(.caption)
                                            Text("\(monster.hitDice)")
                                                .font(.headline)
                                                .foregroundStyle(Color.secondaryDungeon)
                                        }
                                    }
                                    ForEach(monster.armorClass, id:\.self) { data in
                                        VStack(spacing: 20) {
                                            Text("Armor Class")
                                                .font(.title3)
                                                .padding(.top, 10)
                                            HStack(spacing: 10) {
                                                SquareFlexibleModule(useVStack: true, colorBackground: .black.opacity(0.6)) {
                                                    Text("Rype")
                                                        .font(.caption)
                                                    Text("\(data.type)")
                                                        .fontWeight(.semibold)
                                                }
                                                SquareFlexibleModule(useVStack: true, colorBackground: Color.secondaryDungeon.opacity(0.1)) {
                                                    Text("Value")
                                                        .font(.caption)
                                                    Text("\(data.value)")
                                                        .font(.title3)
                                                        .foregroundStyle(Color.accentDungeon)
                                                }
                                            }
                                        }
                                        .padding(10)
                                        .background {
                                            RoundedRectangle(cornerRadius: 20.0)
                                                .fill(Color.secondaryDungeon.opacity(0.1))
                                        }
                                    }
                                }
                            }
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Features")
                                    .font(.title2)
                                VStack {
                                    HStack {
                                        SquareFlexibleModule(useVStack: true, colorBackground: .black.opacity(0.5)) {
                                            Text("strength".uppercased())
                                                .font(.caption)
                                            Text("\(monster.strength)")
                                                .font(.title)
                                        }
                                        SquareFlexibleModule(useVStack: true, colorBackground: .black.opacity(0.5)) {
                                            Text("dexterity".uppercased())
                                                .font(.caption)
                                            Text("\(monster.dexterity)")
                                                .font(.title)
                                        }
                                        SquareFlexibleModule(useVStack: true, colorBackground: .black.opacity(0.5)) {
                                            Text("constitution".uppercased())
                                                .font(.caption)
                                            Text("\(monster.constitution)")
                                                .font(.title)
                                        }
                                    }
                                    HStack {
                                        SquareFlexibleModule(useVStack: true, colorBackground: .black.opacity(0.5)) {
                                            Text("intelligence".uppercased())
                                                .font(.caption)
                                            Text("\(monster.intelligence)")
                                                .font(.title)
                                        }
                                        SquareFlexibleModule(useVStack: true, colorBackground: .black.opacity(0.5)) {
                                            Text("wisdom".uppercased())
                                                .font(.caption)
                                            Text("\(monster.wisdom)")
                                                .font(.title)
                                        }
                                        SquareFlexibleModule(useVStack: true, colorBackground: .black.opacity(0.5)) {
                                            Text("charisma".uppercased())
                                                .font(.caption)
                                            Text("\(monster.charisma)")
                                                .font(.title)
                                        }
                                    }
                                }
                            }
                            
                        }
                        .padding(.horizontal, Constant.containerHPadding)
                        .padding(.bottom, 50)
                    }
                } else {
                    VStack {
                        Text("Sorry, this monster is on vacation.")
                    }
                }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    DetailMonsterView(vm: DetailMonsterViewModel(selectedMonster: "aboleth"))
}
