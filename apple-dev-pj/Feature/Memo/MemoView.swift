//
//  MemoView.swift
//  apple-dev-pj
//
//  Created by FND_02 on 8/14/24.
//

import SwiftUI

struct MemoView: View {
    var body: some View {
        VStack{
            HStack{
                TitleView()
                    .padding(.leading,20)
                Spacer()
            }
            
            Spacer()
                .frame(height: 20)
            HStack{
                AnnouncementView()
                    .padding(.leading,20)
                Spacer()
            }
            
        }
    }
}

private struct TitleView: View {
    fileprivate var body: some View{
        Text("메모 목록")
            .font(.system(size: 26,weight: .bold))
    }
}

private struct AnnouncementView: View {
    fileprivate var body: some View{
        VStack(alignment:.leading){
            Text("메모 해둔 내용이에요!")
            Text("다시 한 번 확인해주세요")
        }
        .font(.system(size: 26,weight: .bold))
    }
}

private struct MemoContentView: View {
    fileprivate var body: some View{
        Text("Asdf")
    }
}

#Preview {
    MemoView()
}
