//
//  RegisterViewModel.swift
//  itmoHumanLab
//
//  Created by Alexander Kozharin on 30.05.2024.
//
import Combine
import Foundation
class RegisterViewModel: ObservableObject {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var confirmPasswordText: String = ""
    @Published var allFieldsValid = false
    
    @Published var hasOneDigit = false
    @Published var hasEightChar = false
    @Published var hasSpecialChar = false
    @Published var hasOneUpperChar = false
    @Published var isPasswordsMatched = false
    @Published var emailValid = false
    @Published var isContinuePressed = false
    
    @Published var btnText: String = "Continue"
    @Published var errorMessage:String = ""
    
    @Published var emailShake: Int = 0
    @Published var passwordShake: Int = 0
    @Published var confirmPasswordShake: Int = 0
    @Published var canLogin: Bool = false
    
    init() {
        passwordValidation()
        emailValidation()
    }
    private func passwordValidation() {
        $passwordText.map{
            password in
            password.count >= 8
        }.assign(to: &$hasEightChar)
        
        $passwordText.map{
            password in
            password.contains{$0.isNumber}
        }
        .assign(to: &$hasOneDigit)
        
        $passwordText.map{
            password in
            password.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*()_+-=[]{}|:\"';<>,.?/~`")) != nil
        }
        .assign(to: &$hasSpecialChar)
        
        $passwordText.map{
            password in
            password.contains{$0.isUppercase}
        }
        .assign(to: &$hasOneUpperChar)
        
        Publishers.CombineLatest($passwordText, $confirmPasswordText)
            .map{ [weak self] _, _ in
                guard let self else {return false}
                return self.passwordText == self.confirmPasswordText
            }
            .assign(to: &$isPasswordsMatched)
        
        Publishers.CombineLatest($passwordText, $confirmPasswordText)
            .map{ [weak self] _, _ in
                guard let self else {return false}
                allFieldsValid = true
                return self.hasOneDigit && self.hasEightChar && self.hasSpecialChar && self.hasOneUpperChar && self.isPasswordsMatched
            }
            .assign(to: &$allFieldsValid)
        
        
    }
    func emailValidation() {
        $emailText.map{
            email in
            email.contains(/[".*@.*\..*"]/)
        }
        .assign(to: &$emailValid)
    }
    
    func login() {
        if allFieldsValid {
            canLogin = true
        }
    }
    
}
