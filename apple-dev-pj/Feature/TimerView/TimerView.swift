import SwiftUI

struct TimerView: View {
    var body: some View {
        TitleView()
        
        Spacer()
            .frame(height: 80)
        
        TimerContentView()
        
        Spacer()
            .frame(height: 50)
        
        startTimerBtnView()
    }
}

private struct TitleView: View {
    @EnvironmentObject private var timerViewModel: TimerViewModel
    fileprivate var body: some View{
        Text(timerViewModel.isStudyTime ? "공부시간" : "쉬는시간")
            .font(.system(size: 40,weight: .bold))
            .foregroundStyle(.blue)
    }
}

private struct TimerContentView: View {
    fileprivate var body: some View{
        ZStack{
            Circle()
                .frame(width: 250)
                .foregroundColor(.blue)
            Circle()
                .frame(width: 230)
                .foregroundColor(.white)
            Text("60:00")
                .font(.system(size: 50,weight: .bold))
                .foregroundColor(.blue)
        }
    }
}

private struct startTimerBtnView: View{
    @EnvironmentObject private var timerViewModel: TimerViewModel
    fileprivate var body: some View{
        Button(
            action:{
                timerViewModel.startTimer()
            },
            label:{
                Image("startTimerBtn")
                    .resizable()
                    .frame(width: 80,height: 80)
            }
        )
    }
}

#Preview {
    TimerView()
        .environmentObject(TimerViewModel())
}
