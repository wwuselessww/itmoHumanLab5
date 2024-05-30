//
//  PasswordValidtaionView.swift
//  itmoHumanLab
//
//  Created by Alexander Kozharin on 30.05.2024.
//

import SwiftUI

struct PasswordValidtaionView: View {
    @State var text: String
    @Binding var toggle: Bool
    
    var body: some View {
        Group{
            if toggle {
                Text(text)
                    .strikethrough()
                    .foregroundStyle(Constants.lightGray)
            } else {
                Text(text)
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    PasswordValidtaionView(text: "at list one digit", toggle: .constant(false))
}
