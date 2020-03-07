//
//  PieChartRow.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI


public struct PieData {
    var data: Double
    var backgroundColor: Color
    var accentColor: Color
}

public struct PieChartRow : View {
    var data: [PieData]

    var slices: [PieSlice] {
        var tempSlices:[PieSlice] = []
        var lastEndDeg:Double = 0
        let maxValue = data.reduce(0, {x, y in
            x + y.data
        })
        for slice in data {
            let normalized:Double = Double(slice.data)/Double(maxValue)
            let startDeg = lastEndDeg
            let endDeg = lastEndDeg + (normalized * 360)
            lastEndDeg = endDeg
            tempSlices.append(PieSlice(startDeg: startDeg, endDeg: endDeg, value: slice.data, normalizedValue: normalized))
        }
        return tempSlices
    }
    public var body: some View {
        GeometryReader { geometry in
            ZStack{
                ForEach(0..<self.slices.count){ i in
                    PieChartCell(rect: geometry.frame(in: .local), startDeg: self.slices[i].startDeg, endDeg: self.slices[i].endDeg, index: i, backgroundColor: self.data[i].backgroundColor,accentColor: self.data[i].accentColor)
                }
            }
        }
    }
}

#if DEBUG
struct PieChartRow_Previews : PreviewProvider {
    static var previews: some View {
        let bgColor =  Color(red: 252.0/255.0, green: 236.0/255.0, blue: 234.0/255.0)
        let accentColor = Color(red: 225.0/255.0, green: 97.0/255.0, blue: 76.0/255.0)
        let pieDataList = [PieData(data: 8, backgroundColor: bgColor, accentColor: accentColor),
        PieData(data: 23, backgroundColor: bgColor, accentColor: accentColor),
        PieData(data: 54,  backgroundColor: bgColor, accentColor: accentColor),
        PieData(data: 32, backgroundColor: bgColor, accentColor: accentColor),
        PieData(data: 12, backgroundColor: bgColor, accentColor: accentColor),
        PieData(data: 37, backgroundColor: bgColor, accentColor: accentColor)]
        return PieChartRow(data:pieDataList).frame(width: 100, height: 100)
        
    }
}
#endif
