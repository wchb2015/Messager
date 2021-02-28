//
//  FirebaseUserListener.swift
//  Messager
//
//  Created by Wang, Chongbei on 2/28/21.
//  Copyright © 2021 com.wchb. All rights reserved.
//

import Foundation
import Firebase


class FirebaseUserListener {
    
    static let shared = FirebaseUserListener()
    
    private init(){}
    
    //MARK: - Login
    
    //MARK: - Register
    func registerUserWIth(email: String,password: String, completion: @escaping (_ error: Error?) -> Void) {
        
        
        Auth.auth().createUser(withEmail: email, password: password){
            (authDataResult,error) in
            completion(error)
            
            if error == nil {
                //send verification email
                authDataResult!.user.sendEmailVerification {
                    (error) in
                    print("auto email sent with error: ", error?.localizedDescription)
                }
                
                //create user and save it
                if authDataResult?.user != nil {
                    let user = User(id: authDataResult!.user.uid, userName: email, email: email, pushId: "", avatarLink: "", status: "Hey there I'm using Messager")
                    
                    saveUserLocally(user)
                    self.saveUserToFirestore(user)
                }
            }
        }
    }
    
    //MARK: - Save users
    func saveUserToFirestore(_ user: User)  {
        do{
            try FirebaseReference(.User).document(user.id).setData(from: user)
        } catch{
            print(error.localizedDescription, "adding user")
        }
    }
    
}
