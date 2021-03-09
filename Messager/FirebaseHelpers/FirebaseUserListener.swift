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
    
    func loginUserWithEmail(email: String, password: String, completion: @escaping (_ error: Error?, _ isEmailVerified: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (authDataResult,error) in
            if error == nil && authDataResult!.user.isEmailVerified {
                
                FirebaseUserListener.shared.downloadUserFromFirebase(userId: authDataResult!.user.uid, email: email)
                
                completion(error,true)
            } else {
                print("Email is not verified")
                completion(error,false)
            }
        }
    }
    
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
    
    //MARK: - Resend link methods
    func resendVerificationEmail(email: String, completion: @escaping (_ error: Error?) -> Void) {
        
        Auth.auth().currentUser?.reload(completion: {
            (error) in
            Auth.auth().currentUser?.sendEmailVerification(completion: {(error) in completion(error)})
        })
    }
    
    func resetPasswordFor(email: String, completion: @escaping (_ error: Error?) -> Void) {
        
        Auth.auth().sendPasswordReset(withEmail: email){
            (error) in completion(error)
        }
    }
    
    
    func logoutCurrentUser(completion: @escaping (_ error: Error?) -> Void){
        do{
            try Auth.auth().signOut()
            
            userDefaults.removeObject(forKey: kCURRENTUSER)
            userDefaults.synchronize()
            
            completion(nil)
        } catch let error as NSError{
            completion(error)
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
    
    //MARK: - Download
    func downloadUserFromFirebase(userId: String, email: String? = nil)  {
        FirebaseReference(.User).document(userId).getDocument {
            (querySnapshot,error) in
            
            guard let document = querySnapshot else {
                print("no document for user")
                return
            }
            
            let result = Result {
                try? document.data(as: User.self)
            }
            
            switch result{
            case .success(let userObject):
                if let user = userObject{
                    saveUserLocally(user)
                } else {
                    print(" Document does not exist")
                }
            case .failure(let error):
                print("Error decoding user", error)
            }
            
            
        }
    }
    
}
