//
//  RegisterView.swift
//  itmoHumanLab
//
//  Created by Alexander Kozharin on 30.05.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var vm = RegisterViewModel()
    var body: some View {
        NavigationStack {
            VStack{
                VStack(spacing: 15){
                    Image(.logoP)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 20, maxWidth: 100, minHeight: 20, maxHeight: 100)
                    
                    Text("Sign up")
                        .font(Font.custom("", size: 30))
                        .fontWeight(.bold)
                        .padding(.bottom)
                    CustomTextField(placeholder: "email", fieldType: .email, text: $vm.emailText)
                        .modifier(Shake( animatableData: CGFloat(vm.emailShake)))
                    CustomTextField(placeholder: "passsword", fieldType: .pass, text: $vm.passwordText)
                        .modifier(Shake( animatableData: CGFloat(vm.passwordShake)))
                    CustomTextField(placeholder: "confirm passsword", fieldType: .pass, text: $vm.confirmPasswordText)
                        .modifier(Shake( animatableData: CGFloat(vm.confirmPasswordShake)))
                    ContinueButton(text: $vm.btnText, action: {
                        withAnimation(.default) {
                            vm.isContinuePressed.toggle()
                            if vm.emailText.isEmpty{
                                vm.emailShake += 1
                            }
                            if vm.passwordText.isEmpty{
                                vm.passwordShake += 1
                            }
                            if vm.confirmPasswordText.isEmpty{
                                vm.confirmPasswordShake += 1
                            }
                        }
                        vm.login()
                    }).navigationDestination(isPresented: $vm.canLogin) {
                        FinalView()
                    }
                    .opacity(!vm.allFieldsValid ? 0.5 : 1)
                    .disabled(!vm.allFieldsValid)

                    
                }
                .padding(.horizontal)
                HStack{
                    VStack(alignment: .leading){
                        VStack{
                            PasswordValidtaionView(text: "email isn't valid", toggle: $vm.emailValid)
                        }
                        .opacity(vm.emailText.isEmpty ? 0 : 1)
                        VStack(alignment: .leading){
                            PasswordValidtaionView(text: "at list one digit", toggle: $vm.hasOneDigit)
                            PasswordValidtaionView(text: "at list eight character", toggle: $vm.hasEightChar)
                            PasswordValidtaionView(text: "at list one special character", toggle: $vm.hasSpecialChar)
                            PasswordValidtaionView(text: "at list one uppercased character", toggle: $vm.hasOneUpperChar)
                            PasswordValidtaionView(text: "passwords matched", toggle: $vm.isPasswordsMatched)
                        }
                        .opacity(vm.passwordText.isEmpty ? 0 : 1)
                        
                        
                    }
                    Spacer()
                }
                .padding(.leading)
                .frame(maxWidth: UIScreen.main.bounds.width)
                
            }
        }
    }
}

#Preview {
    RegisterView()
}
