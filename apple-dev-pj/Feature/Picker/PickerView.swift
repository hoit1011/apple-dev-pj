//
//  PickerView.swift
//
//  Created by FND_02 on 8/13/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct PickerView: View {
    @EnvironmentObject var pickerViewModel : PickerViewModel
    
    var body: some View {
        ZStack{
            Color(.customBlue)
            VStack{
                TitleView()
                
                Spacer()
                    .frame(height: 30)
                
                HStack{
                    PickerContentView()
                }
                
                AnimatedImage(url:URL(string:"https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Smilies/Thinking%20Face.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
                    .padding(.top,70)
                
                Spacer()
                    .frame(height: 90)
                VotingView()
            }
            .alert("휴식시간을 설정해 주세요",
                   isPresented: $pickerViewModel.isAlertMessage
            ) {
                Button("확인",role: .cancel) { }
            }
        }
        .ignoresSafeArea()
    }
}

//MARK: - 타이틀 뷰
private struct TitleView: View {
    fileprivate var body: some View{
        Text("오늘의 휴식시간을 골라 주세요")
            .font(.system(size: 26,weight: .bold))
            .foregroundStyle(.white)
    }
}

//MARK: - 피커 컨텐츠 뷰
private struct PickerContentView: View {
    @EnvironmentObject private var pickerViewModel: PickerViewModel
    
    fileprivate var body: some View{
        ForEach(2..<7, id:\.self) { picker in
            HStack{
                VStack{
                    Text("\(picker*5)분")
                        .padding(.horizontal,10)
                        .foregroundColor(.white)
                    Button(
                        action:{
                            pickerViewModel.selectedBtnTapped(number: picker * 5)
                        },
                        label:{
                            if(picker * 5 == pickerViewModel.selectedButtonIndex){
                                Image("selectedBox")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                            }else{
                                Image("unSelectedBox")
                                    .resizable()
                                    .frame(width: 25,height: 25)
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
    @EnvironmentObject private var pickerViewModel: PickerViewModel
    @EnvironmentObject private var globalState: GlobalState
    fileprivate var body: some View{
        Button(
            action:{
                pickerViewModel.voteBtnTapped()
                globalState.FreeTime = pickerViewModel.selectedButtonIndex
            },
            label:{
                Text("투표하기")
                    .padding(.horizontal,100)
                    .padding(.vertical,10)
                    .foregroundColor(.customBlue)
                    .background(Color.white)
                    .cornerRadius(10)
                    .font(.system(size: 20,weight: .medium))
            }
        )
    }
}

#Preview {
    PickerView()
        .environmentObject(PickerViewModel())
}
