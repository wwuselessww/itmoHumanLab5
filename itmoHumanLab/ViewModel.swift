//
//  ViewModel.swift
//  itmoHumanLab
//
//  Created by Alexander Kozharin on 30.05.2024.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    var errorMessage: String = ""
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var emailShake: Int = 0
    @Published var passwordShake: Int = 0
    @Published var btnShake: Int = 0
    @Published var error: Bool = true
    @Published var isContinuePressed: Bool = false
    
    @Published var oldEmail: String = "1"
    @Published var oldPassword: String = "1"
    @Published var canLogin: Bool = false {didSet{
        print("aloha")
    }}
    
    @Published var btnText: String = "Continue"

    func login() {
        if emailText == oldEmail && oldPassword == passwordText {
            canLogin = true
        }
        emailCheck()
        passwordCheck()
    }
    
    func emailCheck() {
        if !emailText.isEmpty && !emailText.contains(/[.*@.*\..*]/) {
            error = true
            btnText = "invalid email or password"
        } else {
            error = false
            btnText = "Continue"
        }
    }
    
    func passwordCheck() {
        if passwordText != oldPassword{
            error = true
            btnText = "invalid email or password"
        } else {
            passwordText = ""
            error = false
            btnText = "Continue"
        }
    }
  
}
