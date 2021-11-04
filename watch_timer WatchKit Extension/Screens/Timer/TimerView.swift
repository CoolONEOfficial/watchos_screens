//
//  ContentView.swift
//  watch_timer WatchKit Extension
//
//  Created by Nickolay Truhin on 03.11.2021.
//

import SwiftUI

struct TimerView: View {
    @StateObject var vm = TimerViewModel()

    var body: some View {
        VStack(spacing: 0) {
            Text(String(vm.current)).font(.system(size: 70)).id(vm.current)
            Text("OF \(vm.total) SECS").id(vm.total)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .background {
            Ellipse()
                .trim(from: CGFloat(vm.current) / CGFloat(vm.total), to: 1.0)
                .rotation(.degrees(-90))
                .stroke(Color.init(red: 157 / 255, green: 248 / 255, blue: 17 / 255, opacity: 1), style: .init(lineWidth: 10, lineCap: .round))
        }
        .scaleEffect(vm.state == .paused ? 0.9 : 1)
        .onTapGesture {
            vm.tap()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
