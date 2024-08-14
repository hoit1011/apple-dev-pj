//
//  NoVoteTimerView.swift
//  apple-dev-pj
//
//  Created by FND_02 on 8/14/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct NoVoteTimerView: View {
    @Binding var selection: Int
    var body: some View {
        VStack{
            AnimatedImage(url:URL(string:"https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Symbols/Cross%20Mark.png"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 140)
            
            Spacer()
                .frame(height: 50)
            
            NoVoteTimerContentView()
            
            Spacer()
                .frame(height: 50)
            Button(
                action:{
                    selection = 0
                },
                label: {
                    Text("투표하러 가기!")
                        .padding(.horizontal,60)
                        .padding(.vertical,10)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(20)
                        .font(.system(size: 30,weight: .bold))
                }
            )
        }
    }
}

private struct NoVoteTimerContentView: View{
    fileprivate var body: some View{
        VStack{
            Text("아직 시간이")
            Text("정해지지 않았어요.")
            Text("시간을 투표해주세요!")
        }
        .font(.system(size: 30,weight: .bold))
        .foregroundColor(.black)
    }
}
#Preview {
    @State var selection = 0
    return NoVoteTimerView(selection: $selection)
}
