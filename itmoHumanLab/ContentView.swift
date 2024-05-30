//
//  ContentView.swift
//  itmoHumanLab
//
//  Created by Alexander Kozharin on 30.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationStack {
            VStack(spacing: 15){
                Spacer()
                Image(.logoP)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 20, maxWidth: 100, minHeight: 20, maxHeight: 100)
                    
                Text("Log in")
                    .font(Font.custom("", size: 30))
                    .fontWeight(.bold)
                    .padding(.bottom)
                CustomTextField(placeholder: "email", fieldType: .email, text: $vm.emailText)
                    .modifier(Shake( animatableData: CGFloat(vm.emailShake)))
                CustomTextField(placeholder: "passsword", fieldType: .pass, text: $vm.passwordText)
                    .modifier(Shake( animatableData: CGFloat(vm.passwordShake)))
                ContinueButton(text: $vm.btnText, action: {
                    withAnimation(.default) {
                        vm.isContinuePressed.toggle()
                       
                        if vm.emailText.isEmpty{
                            vm.emailShake += 1
                        }
                        if vm.passwordText.isEmpty{
                            vm.passwordShake += 1
                        }
                        if vm.error{
                            vm.btnShake += 1
                        }

                        print(vm.canLogin)
                        vm.login()
                    }
                
                })
                .modifier(Shake( animatableData: CGFloat(vm.btnShake)))
                .navigationDestination(isPresented: $vm.canLogin) {
                    FinalView()
                }
                Group{
                    Text("or")
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }

                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
        

}


#Preview {
    ContentView()
}
