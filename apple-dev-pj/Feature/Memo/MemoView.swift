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
            
            MemoListView()
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

struct MemoListView: View {
    @EnvironmentObject var memoViewModel: MemoVIewModel
    
    var body: some View {
        VStack {
            ForEach(memoViewModel.memos, id: \.self) { memo in
                MemoCardView(memo: memo) {
                    memoViewModel.deleteMemo(memo)
                }
            }
        }
        .padding()
    }
}


private struct MemoCardView: View {
    let memo: String
    let onDelete: () -> Void
    
    var body: some View {
        HStack {
            Text(memo)
                .foregroundColor(.black)
                .padding(.leading, 10)
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "trash.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
                    .padding(.trailing, 10)
            }
        }
        .frame(height: 60)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
#Preview {
    MemoView()
        .environmentObject(MemoVIewModel())
}
