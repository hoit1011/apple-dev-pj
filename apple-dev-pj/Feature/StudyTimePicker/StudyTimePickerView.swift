//
//  StudyTimePickerView.swift
//
//  Created by FND_02 on 8/13/24.
//

//
//  PickerView.swift
//  insta-helper
//
//  Created by FND_02 on 8/13/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct StudyTimePickerView: View {
    @EnvironmentObject private var studyTimePickerViewModel: StudyTimePickerViewModel
    var body: some View{
        ZStack{
            VotingView()
            VStack{
                TitleView()
                
                Spacer()
                    .frame(height: 30)
                
                HStack{
                    StudyTimePickerContentView()
                }
                
                AnimatedImage(url:URL(string:"https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Smilies/Thinking%20Face.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
                    .padding(.top,70)
                
                Spacer()
                    .frame(height: 90)
            }.alert("공부시간을 설정해 주세요",
                    isPresented: $studyTimePickerViewModel.isAlertMessage
            ) {
                Button("확인",role: .cancel) { }
            }
        }
    }
}


//MARK: - 타이틀 뷰
private struct TitleView: View {
    fileprivate var body: some View{
        Text("오늘의 공부시간을 골라 주세요")
            .font(.system(size: 26,weight: .bold))
            .foregroundStyle(.black)
    }
}

//MARK: - 스터디 타임 피커 컨텐츠 뷰

private struct StudyTimePickerContentView: View {
    @EnvironmentObject private var studyTimePickerViewModel: StudyTimePickerViewModel
    
    fileprivate var body: some View{
        ForEach(10..<15, id:\.self) { picker in
            HStack{
                VStack{
                    Text("\(picker*5)분")
                        .padding(.horizontal,10)
                        .foregroundColor(.black)
                    Button(
                        action:{
                            studyTimePickerViewModel.selectedBtnTapped(number: picker * 5)
                        },
                        label:{
                            if(picker * 5 == studyTimePickerViewModel.selectedButtonIndex){
                                Image("selectedBox")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.black)
                                    
                            }else{
                                Image("unSelectedBox")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.black)
                            }
                        }
                    )
                }
            }
        }
    }
}

//MARK: - 투표하기 뷰
private struct VotingView: View {
    @EnvironmentObject private var studyTimePickerViewModel: StudyTimePickerViewModel
    @EnvironmentObject private var globalState: GlobalState
    fileprivate var body: some View{
        Button(
            action:{
                studyTimePickerViewModel.voteBtnTapped()
                globalState.StudyTime = studyTimePickerViewModel.selectedButtonIndex
            },
            label:{
                CustomButtonView(message: "투표하기")
            }
        )
    }
}

#Preview {
    StudyTimePickerView()
        .environmentObject(StudyTimePickerViewModel())
}
