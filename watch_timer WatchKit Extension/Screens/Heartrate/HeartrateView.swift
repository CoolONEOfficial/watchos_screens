//
//  HeartrateView.swift
//  watch_timer WatchKit Extension
//
//  Created by Nickolay Truhin on 04.11.2021.
//

import SwiftUI
import SwiftUIX
import DynamicColor

struct CardView: View {
    var title: String
    var heart: Bool
    var bpm: Int
    var caption: String
    
    @State var heartMin = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.system(size: 14))
                HStack(spacing: 2) {
                    if heart {
                        Image("heart").resizable()
                            .width(25).height(25).padding(.trailing, 2).padding(.top, 4)
                            .scaleEffect(heartMin ? 0.8 : 1)
                            .onAppear {
                                withAnimation(Animation.linear(duration: Double(60) / Double(bpm)).repeatForever()) {
                                    heartMin.toggle()
                                }
                            }
                    }
                    Text(String(bpm)).font(.system(size: 23))
                    Text("BPM").font(.system(size: 23)).foregroundColor(.red)
                }
                
                Text(caption).font(.system(size: 14)).opacity(0.5)
            }
            Spacer()
        }
            .padding(.horizontal, 8).padding(.vertical, 4)
            .background(Color(uiColor: .init(red: 203/255, green: 203/255, blue: 203/255, alpha: 0.14)))
            .cornerRadius(5)
            
    }
}

struct HeartrateView: View {
    var body: some View {
        
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 4) {
                CardView(title: "Current", heart: true, bpm: 58, caption: "58 BPM, 3m ago")
                CardView(title: "Resting Rate", heart: false, bpm: 56, caption: "Today")
            }.maxWidth(.infinity)
        }
        .navigationTitle("Heart Rate")
    }
}

struct HeartrateView_Previews: PreviewProvider {
    static var previews: some View {
        HeartrateView()
    }
}
