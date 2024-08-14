import SwiftUI

struct TimerView: View {
    @EnvironmentObject private var timerViewModel: TimerViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack(alignment:.bottom){
            Button(
                action:{
                    
                },
                label: {
                    CustomButtonView(message: "메모하기")
                }
            )
            VStack {
                TitleView()
                
                Spacer()
                    .frame(height: 20)
                
                TimerContentView()
                
                Spacer()
                    .frame(height: 30)
                
                TimerMemoView()
                Spacer()
                    .frame(height: 100)
            }
        }
        .onAppear {
            timerViewModel.startTimer()
        }
//        .toolbar(.hidden, for:.tabBar)
        .navigationBarBackButtonHidden()
        .onChange(of: timerViewModel.shouldDismiss) { shouldDismiss in
            if shouldDismiss {
                dismiss()
            }
        }
    }
}

private struct TitleView: View {
    @EnvironmentObject private var timerViewModel: TimerViewModel
    fileprivate var body: some View {
        Text(timerViewModel.isStudyTime ? "공부시간" : "쉬는시간")
            .font(.system(size: 35, weight: .bold))
            .foregroundStyle(.black)
    }
}

private struct TimerContentView: View {
    @EnvironmentObject private var timerViewModel: TimerViewModel
    
    fileprivate var body: some View {
        ZStack {
            Circle()
                .frame(width: 250)
                .foregroundColor(timerViewModel.isStudyTime ? .blue : .customMint)
            Circle()
                .frame(width: 230)
                .foregroundColor(.white)
            Text(timerViewModel.isStudyTime ? timerViewModel.formatTime(timeRemaining: timerViewModel.timeRemaining):
                    timerViewModel.formatTime(timeRemaining: timerViewModel.freeTimeRemaining))
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(timerViewModel.isStudyTime ? .blue : .customMint)
        }
    }
}

private struct TimerMemoView: View {
    @State var memo: String = ""
    fileprivate var body: some View{
            TextField("메모내용...",text: $memo)
                .padding()
                .frame(width: 250,height: 100)
                .foregroundColor(.black)
                .background(.customGray)
                .cornerRadius(10)
    }
}

#Preview {
    TimerView()
        .environmentObject(TimerViewModel())
}
