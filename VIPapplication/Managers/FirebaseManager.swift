//
//  FirebaseManager.swift
//  VIPapplication
//
//  Created by Braeden Meikle on 3/26/22.
//

import Foundation
import Firebase

/* All of the Firebase login/signup/reset password functions are contained in this class, allowing imports
 and duplicated code to be saved */
class FirebaseManager {
    
    // login function for Firebase
    static func handleLogin(email: String, password: String) -> Bool {
        var retVal: Bool = true
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // error
                // show text on screen saying incorrect username or password
                successfulLogin = false;
                retVal = false
            } else {
                // no error
                user.uid = Auth.auth().currentUser?.uid ?? ""
                print(user.uid)
                successfulLogin = true
                self.showHomePageView = true
            }
        }
        return retVal
    }
    
    // sign up function for Firebase
    static func handleSignup(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                // failure
            } else {
                // success
            }
        }
    }
    
    // reset password function for Firebase
    static func handleResetPassword(email:String, resetCompletion:@escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            if let error = error {
                resetCompletion(.failure(error))
            } else {
                resetCompletion(.success(true))
            }
        }
    )}
}
