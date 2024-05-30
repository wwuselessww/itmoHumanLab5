//
//  ContinueButton.swift
//  itmoHumanLab
//
//  Created by Alexander Kozharin on 30.05.2024.
//

import SwiftUI

struct ContinueButton: View {
    @Binding var text: String
    var action: () -> Void
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
            Button(action:{
               action()
            }, label: {
                Text(text)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            })
        }
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 50)
    }
}

#Preview {
    ContinueButton(text: .constant("Continue"), action: {
        print("s")
    })
}
