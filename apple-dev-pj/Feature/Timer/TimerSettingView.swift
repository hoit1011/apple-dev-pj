import SwiftUI
import SDWebImageSwiftUI

struct TimerSettingView: View {
    @EnvironmentObject private var globalState: GlobalState
    @EnvironmentObject private var timerViewModel: TimerViewModel
    @State private var navigateToNextView = false

    
    var body: some View {
        NavigationStack{
            VStack {
                TitleView()
                
                AnimatedImage(url: URL(string: "https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Alarm%20Clock.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                
                TimerSettingViewContent()
                
                Spacer()
                    .frame(height: 100)
                
                Button(
                    action: {
                        timerViewModel.settingBtnTapped(Freetime: globalState.FreeTime ?? 0, StudyTime: globalState.StudyTime ?? 0)
                        navigateToNextView = true
                    },
                    label: {
                        Text("공부를 시작하시겠습니까?")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                            .font(.system(size: 28, weight: .bold))
                    }
                )
                NavigationLink(destination: TimerView(), isActive: $navigateToNextView) {
                    EmptyView()
                }
            }
        }
    }
}

private struct TitleView: View {
    var body: some View {
        Text("오늘의 시간 정보!")
            .font(.system(size: 40, weight: .bold))
            .foregroundStyle(.blue)
    }
}

private struct TimerSettingViewContent: View {
    @EnvironmentObject private var globalState: GlobalState
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("공부: \(globalState.StudyTime ?? 0)분")
            Text("휴식: \(globalState.FreeTime ?? 0)분 입니다!")
        }
        .font(.system(size: 40, weight: .bold))
        .foregroundColor(.blue)
    }
}

#Preview {
    NavigationView {
        TimerSettingView()
            .environmentObject(GlobalState())
            .environmentObject(TimerViewModel())
    }
}
