//
//  OnbordingView.swift
//
//  Created by FND_02 on 8/13/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct OnbordingView: View {
    @State var selection:Int = 0
    @EnvironmentObject var pickerViewModel : PickerViewModel
    @EnvironmentObject var globalState: GlobalState
    var body: some View {
        TabView(selection: $selection){
            if globalState.StudyTime == nil{
                StudyTimePickerView()
                    .environmentObject(StudyTimePickerViewModel())
                    .tabItem {
                        Image(systemName: "archivebox")
                            .foregroundColor(.white)
                    }
            } else if globalState.FreeTime == nil{
                PickerView()
                    .environmentObject(PickerViewModel())
                    .tabItem {
                        Image(systemName: "archivebox")
                            .foregroundColor(.white)
                    }
            } else {
                VoteResultView()
                    .environmentObject(globalState)
                    .tabItem {
                        Image(systemName: "archivebox")
                            .foregroundColor(.white)
                    }
            }
            Text("timer")
                .tabItem {
                    Image(systemName: "timer")
                }
            Text("v")
                .tabItem {
                    Image(systemName: "highlighter")
                }
        }
        .accentColor(.white)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnbordingView()
        .environmentObject(PickerViewModel())
        .environmentObject(StudyTimePickerViewModel())
        .environmentObject(GlobalState())

}
