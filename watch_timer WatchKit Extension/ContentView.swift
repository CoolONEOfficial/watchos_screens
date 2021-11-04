//
//  ContentView.swift
//  watch_timer WatchKit Extension
//
//  Created by Nickolay Truhin on 04.11.2021.
//

import SwiftUI
import SwiftUIX

struct ContentView: View {
    var items = Array(0..<17).map { "Image-\($0 % 7)" }
    
    var columnsCount: Int { Int(sqrt(Double(items.count)).rounded(.up)) }
    
    var cellSize: CGFloat = 37
    
    var spacing: CGFloat = 8
    
    @State var timer = false
    @State var heartrate = false
    @State var feed = false
    @State var call = false
    
    func isOdd(
        _ num: Int
    ) -> Bool {
        let firstPart: Int = columnsCount - 1
        let secondPart: Int = columnsCount
        
        var counter = 0
        
        while(true) {
            if counter + firstPart > num {
                return true
            }
            counter += firstPart
            
            if counter + secondPart > num {
                return false
            }
            counter += secondPart
        }
    }

    var dataView: some View {
        ForEach(Array(items.enumerated()), id: \.offset) { (index, name) in
            let padding = !isOdd(index)
            
            Group {
                Image(name).resizable().onTapGesture {
                    switch index % 7 {
                    case 0:
                        timer = true
                        
                    case 1:
                        heartrate = true
                    case 2:
                        feed = true
                    case 3:
                        call = true
                        
                    default: break
                    }
                }
                
                

                if index % (columnsCount * 2 - 1) == columnsCount - 2 {
                    Spacer()
                }
            }.frame(width: cellSize, height: cellSize)
                .padding(.leading, padding ? -cellSize / 2 : 0).padding(.trailing, padding ? cellSize / 2 : 0)
        }
    }
    
    var body: some View {
        ScrollView([.horizontal, .vertical], showsIndicators: false) {
            LazyVGrid(
                columns: .init(repeating: .init(.fixed(cellSize), spacing: spacing), count: columnsCount),
                alignment: .leading,
                spacing: spacing
            ) {
                dataView
            }.padding(.leading, cellSize / 2).padding(.trailing, -cellSize / 2)
            
            NavigationLink("", isActive: $timer) { TimerView() }.hidden()
            NavigationLink("", isActive: $heartrate) { HeartrateView() }.hidden()
            NavigationLink("", isActive: $feed) { FeedView() }.hidden()
            NavigationLink("", isActive: $call) { CallView() }.hidden()
        }.navigationTitle("Topics")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
