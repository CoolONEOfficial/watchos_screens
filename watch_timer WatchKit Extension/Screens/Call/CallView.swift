//
//  CallView.swift
//  watch_timer WatchKit Extension
//
//  Created by Nickolay Truhin on 04.11.2021.
//

import SwiftUI
import DynamicColor

struct CallView: View {
    var body: some View {
        VStack {
            Image("avatar").resizable().width(60).height(60)
            Spacer()
            Text("Sylvie").font(.system(size: 20))
            Text("INCOMING CALL").font(.system(size: 12)).foregroundColor(.init(hex: 0x78FF48)).opacity(0.5)
            Spacer()
            HStack {
                Image("red").resizable().width(50).height(50)
                Spacer()
                Image("green").resizable().width(50).height(50)
            }
        }.padding(.horizontal, 25)
    }
}

struct CallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView()
    }
}
