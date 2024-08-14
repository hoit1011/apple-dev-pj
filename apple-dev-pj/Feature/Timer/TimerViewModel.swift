import Foundation

class TimerViewModel: ObservableObject {
    @Published var isStudyTime: Bool
    @Published var time: Time
    @Published var timer: Timer?
    @Published var timeRemaining: Int
    @Published var freeTimeRemaining: Int
    
    init(
        isStudyTime: Bool = true,
        timer: Timer? = nil,
        time: Time = .init(minutes: 0, seconds: 0),
        timeRemaining: Int = 0,
        freeTimeRemaining: Int = 0
    ) {
        self.isStudyTime = isStudyTime
        self.timer = timer
        self.time = time
        self.timeRemaining = timeRemaining
        self.freeTimeRemaining = freeTimeRemaining
    }
    
    func settingBtnTapped(Freetime: Int, StudyTime: Int) {
        self.isStudyTime = true
        self.timeRemaining = StudyTime
        self.freeTimeRemaining = Freetime
        
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
            withTimeInterval: 0.1,
            repeats: true
        ) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
            }
        }
        
        print("공부 타이머 시작!")
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        isStudyTime.toggle()
        print("공부 타이머 종료!")
        
        startFreeTimeTimer()
    }
    
    private func startFreeTimeTimer() {
        guard timer == nil else { return }

        timer = Timer.scheduledTimer(
            withTimeInterval: 1.0, 
            repeats: true
        ) { _ in
            if self.freeTimeRemaining > 0 {
                self.freeTimeRemaining -= 1
            } else {
                self.stopFreeTimeTimer()
            }
        }
        
        print("프리 타임 타이머 시작!")
    }
    
    private func stopFreeTimeTimer() {
        timer?.invalidate()
        timer = nil
        print("프리 타임 타이머 종료!")
    }
}
