import Foundation

class TimerViewModel: ObservableObject {
    @Published var isStudyTime: Bool
    @Published var time: Time
    @Published var timer: Timer?
    @Published var timeRemaining: Int
    
    init(
        isStudyTime: Bool = true,
        timer: Timer? = nil,
        time: Time = .init(minutes: 0, seconds: 0),
        timeRemaining: Int = 0
    ) {
        self.isStudyTime = isStudyTime
        self.timer = timer
        self.time = time
        self.timeRemaining = timeRemaining
    }
    
    func settingBtnTapped(Freetime: Int, StudyTime: Int) {
        self.isStudyTime = true
        self.timeRemaining = StudyTime * 60
        
        print("프리타임:\(Freetime)")
        print("스터디타임:\(StudyTime)")
    }
    
    func formatTime(timeRemaining: Int) -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    func startTimer() {
        guard timer == nil else { return }

        timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true
        ) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
            }
        }
        
        print("타이머 시작!")
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        print("타이머 종료!")
    }
}
