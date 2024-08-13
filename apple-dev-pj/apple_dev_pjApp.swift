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
    var body: some Scene {
        WindowGroup {
            OnbordingView()
        }
    }
}

class GlobalState: ObservableObject {
    @Published var FreeTime: Int? = nil
    @Published var StudyTime: Int? = nil
}
