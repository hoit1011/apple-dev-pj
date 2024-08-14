//
//  VoteResultView.swift
//
//  Created by FND_02 on 8/13/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct VoteResultView: View {
    @EnvironmentObject private var globalState: GlobalState
    var body: some View {
        ZStack(alignment:.bottom){
            VStack{
                TitleView()
                
                Spacer()
                    .frame(height: 50)
                
                VoteResultContentView()
                
                AnimatedImage(url:URL(string:"https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Smilies/Partying%20Face.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
                    .padding(.top,20)
                
                Spacer()
                    .frame(height: 80)
            }
            Button(
                action:{globalState.FreeTime = nil;
                    globalState.StudyTime = nil},
                label:{
                    CustomButtonView(message: "다시 투표하러 가기!")
                }
            )
        }
        .ignoresSafeArea()
    }
}

private struct TitleView:View {
    fileprivate var body: some View{
        Text("오늘의 선택결과!")
            .font(.system(size: 30,weight: .bold))
            .foregroundStyle(.black)
    }
}

private struct VoteResultContentView: View {
    @EnvironmentObject private var globalState: GlobalState
    
    fileprivate var body: some View{
        VStack{
            Text("공부:\(globalState.StudyTime ?? 0)분")
            Text("휴식:\(globalState.FreeTime ?? 0)분")
        }
        .font(.system(size: 30,weight: .bold))
        .foregroundColor(.black)
        .monospaced()
    }
}

#Preview {
    VoteResultView()
        .environmentObject(GlobalState())
}
