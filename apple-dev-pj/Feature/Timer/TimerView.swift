import SwiftUI

struct TimerView: View {
    @EnvironmentObject private var timerViewModel: TimerViewModel
    
    var body: some View {
        VStack {
            TitleView()
            
            Spacer()
                .frame(height: 80)
            
            TimerContentView()
            
            Spacer()
                .frame(height: 50)
        }
        .onAppear {
            timerViewModel.startTimer()
        }
    }
}

private struct TitleView: View {
    @EnvironmentObject private var timerViewModel: TimerViewModel
    fileprivate var body: some View {
        Text(timerViewModel.isStudyTime ? "공부시간" : "쉬는시간")
            .font(.system(size: 40, weight: .bold))
            .foregroundStyle(.blue)
    }
}

private struct TimerContentView: View {
    @EnvironmentObject private var timerViewModel: TimerViewModel
    
    fileprivate var body: some View {
        ZStack {
            Circle()
                .frame(width: 250)
                .foregroundColor(.blue)
            Circle()
                .frame(width: 230)
                .foregroundColor(.white)
            Text(timerViewModel.formatTime(timeRemaining: timerViewModel.timeRemaining))
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    TimerView()
        .environmentObject(TimerViewModel())
}
