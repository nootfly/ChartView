//
//  File.swift
//  
//
//  Created by Noot Fang on 7/3/20.
//

import SwiftUI

public struct PieData {
    var data: Double
    var backgroundColor: Color
    var accentColor: Color

    public init(data: Double, backgroundColor: Color, accentColor: Color) {
        self.data = data
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
    }
}
