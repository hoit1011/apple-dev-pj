//
//  PickerViewModel.swift
//
//  Created by FND_02 on 8/13/24.
//

import Foundation

class PickerViewModel : ObservableObject{
    @Published var selectedButtonIndex: Int?
    @Published var isVoteBtn: Bool
    @Published var isAlertMessage: Bool
    
    init(
        selectedButtonIndex: Int? = nil,
        isVoteBtn: Bool = false,
        isAlertMessage: Bool = false
    ) {
        self.selectedButtonIndex = selectedButtonIndex
        self.isVoteBtn = isVoteBtn
        self.isAlertMessage = isAlertMessage
    }
    
    func selectedBtnTapped(number: Int){
        selectedButtonIndex = number
        print(selectedButtonIndex ?? 0)
    }
    
    func voteBtnTapped(){
        if(selectedButtonIndex == nil){
            isAlertMessage = true
            return;
        }
        isVoteBtn = true
        //TODO: - 투표되는 기능
        print("투표되었습니다")
    }
}

