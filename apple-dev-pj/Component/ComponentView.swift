//
//  ComponentView.swift
//  apple-dev-pj
//
//  Created by FND_02 on 8/14/24.
//

import SwiftUI

struct CustomButtonView: View {
    @State var message: String
    
    init(message: String = "hi") {
        self.message = message
    }
    
    var body: some View {
        Text(message)
            .padding(.horizontal,125)
            .padding(.vertical,15)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(20)
            .font(.system(size: 20,weight: .bold))
    }
}

#Preview {
    CustomButtonView()
}
