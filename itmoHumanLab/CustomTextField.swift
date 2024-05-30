//
//  CustomTextField.swift
//  itmoHumanLab
//
//  Created by Alexander Kozharin on 30.05.2024.
//

import SwiftUI

struct CustomTextField: View {
    @State var placeholder: String
    @State var showPass:Bool = false
    var fieldType: FieldType
    @Binding var text: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Constants.lightGray)
            HStack{
                if fieldType == .email || showPass {
                    TextField("", text: $text)
                        .placeholder(when: text.isEmpty, placeholder: {
                            Text(placeholder)
                                .foregroundStyle(.gray)
                        })
                } else {
                    SecureField("", text: $text)
                        .placeholder(when: text.isEmpty, placeholder: {
                            Text(placeholder)
                                .foregroundStyle(.gray)
                        })
                }
                Spacer()
                Button(action: {
                    if fieldType == .pass {
                        showPass.toggle()
                    } else {
                        text = ""
                    }
                }, label: {
                    Group{
                        if fieldType == .pass {
                            if showPass {
                                Image(systemName: "eye.fill")
                            } else {
                                Image(systemName: "eye.slash.fill")
                            }
                            
                        } else {
                            Image(systemName: "multiply.circle.fill")
                        }
                    }
                    .foregroundStyle(.gray)
                        
                })
                   
                    
                
            }
            .padding(.horizontal)
            
        }
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 50)
        
    }
}

#Preview {
    CustomTextField(placeholder: "email", fieldType: .email, text: .constant(""))
}
