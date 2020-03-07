//
//  PieChartView.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct PieChartView : View {
    public var data: [PieData]
    public var title: String
    public var legends: [String]?
    public var style: ChartStyle
    public var formSize:CGSize
    public var dropShadow: Bool

    public init(data: [PieData], title: String, legends: [String]? = nil, style: ChartStyle = Styles.pieChartStyleOne, form: CGSize? = ChartForm.medium, dropShadow: Bool? = true){
        self.data = data
        self.title = title
        self.legends = legends
        self.style = style
        self.formSize = form!
        self.dropShadow = dropShadow!
    }
    
    public var body: some View {
        ZStack{
            Rectangle()
                .fill(self.style.backgroundColor)
                .cornerRadius(20)
                .shadow(color: self.style.dropShadowColor, radius: self.dropShadow ? 12 : 0)
            VStack(alignment: .leading){
                HStack{
                    Text(self.title)
                        .font(.headline)
                        .foregroundColor(self.style.textColor)
                    Spacer()
                    Image(systemName: "chart.pie.fill")
                        .imageScale(.large)
                        .foregroundColor(self.style.legendTextColor)
                }.padding()
                PieChartRow(data: data)
                    .foregroundColor(self.style.accentColor).padding(self.legends != nil ? 0 : 12).offset(y:self.legends != nil ? 0 : -10)
                if(self.legends != nil) {
                    List {
                        ForEach(0..<legends!.count) { idx in
                            Text(self.legends![idx])
                                 .font(.subheadline)
                                .foregroundColor(self.data[idx].accentColor)
                                 .padding()
                        }
                    }

                }
                
            }
        }.frame(width: self.formSize.width, height: self.formSize.height)
    }
}

#if DEBUG
struct PieChartView_Previews : PreviewProvider {
    static var previews: some View {
        let bgColor =  Color(red: 252.0/255.0, green: 236.0/255.0, blue: 234.0/255.0)
               let accentColor = Color(red: 225.0/255.0, green: 97.0/255.0, blue: 76.0/255.0)
               let pieDataList = [PieData(data: 8, backgroundColor: bgColor, accentColor: accentColor),
               PieData(data: 56, backgroundColor: bgColor, accentColor: accentColor),
               PieData(data: 78,  backgroundColor: bgColor, accentColor: accentColor),
               PieData(data: 53, backgroundColor: bgColor, accentColor: accentColor),
               PieData(data: 65,  backgroundColor: bgColor, accentColor: accentColor),
               PieData(data: 54, backgroundColor: bgColor, accentColor: accentColor)]
        return PieChartView(data:pieDataList, title: "Title", legends: ["Legend"])
    }
}
#endif
