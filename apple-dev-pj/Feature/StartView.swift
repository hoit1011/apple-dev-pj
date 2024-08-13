//
//  StartView.swift
//
//  Created by FND_02 on 8/13/24.
//

import SwiftUI

struct StartView: View {
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.customBlue)
                
                VStack(alignment: .leading){
                    Text("기분 좋은 하루네요!👋")
                        .font(.system(size: 27,weight: .bold))
                        .foregroundStyle(.white)
                    Text("오늘도 공부하러 가볼까요 ?")
                        .font(.system(size: 27,weight: .bold))
                        .foregroundStyle(.white)
                }
                .padding(.bottom,400)
                
                NavigationLink(
                    destination: OnbordingView(),
                    label: {
                        Text("Next")
                            .padding(.horizontal, 115)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .foregroundStyle(.customBlue)
                            .font(.system(size: 22, weight: .bold))
                            .cornerRadius(14)
                            .shadow(radius: 1, x: -1, y: 5)
                    }
                )
                .padding(.top, 700)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    StartView()
        .environmentObject(PickerViewModel())
        .environmentObject(StudyTimePickerViewModel())
        .environmentObject(GlobalState())
}
