//
//  MemoVIewModel.swift
//  apple-dev-pj
//
//  Created by FND_02 on 8/14/24.
//

import Foundation

class MemoVIewModel: ObservableObject {
    @Published var memos : [String]
    
    init(memos: [String] = []) {
        self.memos = memos
    }
    
    func addMemo(_ memo: String) {
        guard !memo.isEmpty else { return }
        memos.append(memo)
    }
    
    func deleteMemo(_ memo: String) {
        if let index = memos.firstIndex(of: memo) {
            memos.remove(at: index)
        }
    }
}
