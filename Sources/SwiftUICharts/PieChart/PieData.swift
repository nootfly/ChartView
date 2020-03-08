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
    var title: String

    public init(data: Double, backgroundColor: Color, accentColor: Color, title: String) {
        self.data = data
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.title = title
    }
}
