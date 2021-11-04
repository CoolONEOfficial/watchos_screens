//
//  ContentViewModel.swift
//  watch_timer WatchKit Extension
//
//  Created by Nickolay Truhin on 03.11.2021.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    var timer: Timer?
    deinit { timer?.invalidate() }
    
    @Published var total = 30
    @Published var current = 0
    
    enum State {
        case started
        case stopped
        case paused
    }
    
    @Published var state: State = .stopped {
        didSet {
            switch state {
            case .started:
                if oldValue == .stopped {
                    current = 0
                }
                startTimer()
                
            case .stopped, .paused:
                stopTimer()
            }
        }
    }

    func timerFire(_ timer: Timer) {
        withAnimation {
            if current < total {
                current += 1
            } else {
                state = .stopped
            }
        }
    }

    func startTimer() {
        timer = .scheduledTimer(withTimeInterval: 1, repeats: true, block: timerFire)
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func tap() {
        withAnimation {
            switch state {
            case .paused:
                state = .started
                
            case .started:
                state = .paused
                
            case .stopped:
                state = .started
            }
        }
    }
}
