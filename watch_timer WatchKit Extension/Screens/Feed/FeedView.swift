//
//  FeedView.swift
//  watch_timer WatchKit Extension
//
//  Created by Nickolay Truhin on 04.11.2021.
//

import SwiftUI
import SwiftUIX

struct FeedView: View {
    var body: some View {
        VStack {
            TabView {
                ForEach(Range(7...10)) { index in
                    Image("Image-\(index)").resizable().scaledToFill().height(120)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never)).cornerRadius(10).padding(.bottom, 20)
            
            HStack {
                VStack(spacing: 2) {
                    Image("like").resizable().width(17).height(15)
                    Text("45").font(.system(size: 8))
                }.padding(.leading, 20)
                Spacer()
                VStack(spacing: 2) {
                    Image("comment").resizable().width(17).height(15)
                    Text("5").font(.system(size: 8))
                }.padding(.trailing, 20)
            }
        }.navigationTitle("Feed")
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
