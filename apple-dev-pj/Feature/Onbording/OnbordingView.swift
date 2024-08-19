import SwiftUI
import SDWebImageSwiftUI

struct OnbordingView: View {
    @State var selection: Int = 0
    @EnvironmentObject var pickerViewModel: PickerViewModel
    @EnvironmentObject var globalState: GlobalState
    @EnvironmentObject var memoViewModel: MemoVIewModel
    
    var body: some View {
        TabView(selection: $selection) {
            if globalState.StudyTime == nil {
                StudyTimePickerView()
                    .environmentObject(StudyTimePickerViewModel())
                    .tabItem {
                        Image(systemName: "archivebox")
                    }
                    .tag(0)
            } else if globalState.FreeTime == nil {
                PickerView()
                    .environmentObject(PickerViewModel())
                    .tabItem {
                        Image(systemName: "archivebox")
                    }
                    .tag(1)
            } else {
                VoteResultView()
                    .environmentObject(globalState)
                    .tabItem {
                        Image(systemName: "archivebox")
                    }
                    .tag(2)
            }
            if globalState.FreeTime == nil || globalState.StudyTime == nil {
                NoVoteTimerView(selection: $selection)
                    .tabItem {
                        Image(systemName: "timer")
                    }
                    .tag(3)
            } else {
                TimerSettingView()
                    .environmentObject(globalState)
                    .environmentObject(memoViewModel)
                    .tabItem {
                        Image(systemName: "timer")
                    }
                    .tag(3)
            }
            
            MemoView()
                .environmentObject(memoViewModel)
                .tabItem {
                    Image(systemName: "highlighter")
                }
                .tag(4)
        }
        .accentColor(.black)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnbordingView()
        .environmentObject(PickerViewModel())
        .environmentObject(StudyTimePickerViewModel())
        .environmentObject(GlobalState())
        .environmentObject(TimerViewModel())
        .environmentObject(MemoVIewModel())
}
