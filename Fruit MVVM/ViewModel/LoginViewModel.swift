//
//  LoginViewModel.swift
//  Fruit MVVM
//
//  Created by Hamzah Azam on 13/04/2023.
//

import Foundation

class LoginViewModel{
    
    func doValidLogin(emailID:String?, passwordID:String?)->Bool{
        var isValid = false
        guard let emailID = emailID else{
            return isValid
        }
        guard let password = passwordID else{
            return isValid
        }
        let isValidPassword = password.count >= 6
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        let isEmailValid = emailPredicate.evaluate(with: emailID)
        
        isValid = isEmailValid && isValidPassword
            return isValid
        }
}
