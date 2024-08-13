//
//  TimerViewModel.swift
//  apple-dev-pj
//
//  Created by FND_02 on 8/13/24.
//

import Foundation

class TimerViewModel: ObservableObject{
    @Published var isStudyTime: Bool
    
    init(isStudyTime: Bool = true) {
        self.isStudyTime = isStudyTime
    }
    
    func startTimer(){
        print("타이머 시작!")
    }
}
