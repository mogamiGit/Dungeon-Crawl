//
//  Extensions.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 24/9/23.
//

import SwiftUI

extension Color {
    static let mainDungeon = Color("Red Dungeon")
    static let secondaryDungeon = Color("Cream Dungeon")
    static let accentDungeon = Color("Orange Dungeon")
    static let bgDungeon = Color("Dark Dungeon")
}

public extension Binding {
    static func convert<TInt, TFloat>(from intBinding: Binding<TInt>) -> Binding<TFloat>
    where TInt:   BinaryInteger,
          TFloat: BinaryFloatingPoint{

        Binding<TFloat> (
            get: { TFloat(intBinding.wrappedValue) },
            set: { intBinding.wrappedValue = TInt($0) }
        )
    }

    static func convert<TFloat, TInt>(from floatBinding: Binding<TFloat>) -> Binding<TInt>
    where TFloat: BinaryFloatingPoint,
          TInt:   BinaryInteger {

        Binding<TInt> (
            get: { TInt(floatBinding.wrappedValue) },
            set: { floatBinding.wrappedValue = TFloat($0) }
        )
    }
}

