//
//  ContentView.swift
//  FrstMacOSSwiftUI
//
//  Created by Furkan Hanci on 11/16/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    @State var dataPoint : [[CGFloat]] = [
        [ 50 , 100 , 150 , 50 , 40 , 110 , 200 ],
        [ 150 , 100 , 50 , 200 , 10 , 60 , 75 , 25],
        [10 , 20 , 30 , 40 , 50 , 60 , 70 , 80]
    
    ]
    
    var body: some View {
       
        ZStack {
            
            Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Graphic")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                    
                    
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal , 24)
                
                
                HStack(spacing: 20) {
                    BarChart(value: dataPoint[pickerSelectedItem][0], day: "Su")
                    BarChart(value: dataPoint[pickerSelectedItem][1], day: "M")
                    BarChart(value: dataPoint[pickerSelectedItem][2], day: "T")
                    BarChart(value: dataPoint[pickerSelectedItem][3], day: "W")
                    BarChart(value: dataPoint[pickerSelectedItem][4], day: "Th")
                    BarChart(value: dataPoint[pickerSelectedItem][5], day: "F")
                    BarChart(value: dataPoint[pickerSelectedItem][6], day: "Sa")
                    
                }.padding(.top , 24)
                .animation(.default)
            }
            
        }
        
    }
}

struct BarChart: View {
    
    var value : CGFloat = 0
    var day : String = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
                
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            
            Text(day).padding(.top , 8)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
