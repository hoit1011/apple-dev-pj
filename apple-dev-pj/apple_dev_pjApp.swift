//
//  apple_dev_pjApp.swift
//  apple-dev-pj
//
//  Created by FND_02 on 8/13/24.
//

import SwiftUI

@main
struct apple_dev_pjApp: App {
    @StateObject var globalState = GlobalState()
    @StateObject var timerViewModel = TimerViewModel()
    var body: some Scene {
        WindowGroup {
            OnbordingView()
                .environmentObject(globalState)
                .environmentObject(timerViewModel)
        }
    }
}

class GlobalState: ObservableObject {
    @Published var FreeTime: Int? = nil
    @Published var StudyTime: Int? = nil
}
