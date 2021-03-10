//
//  FileStorage.swift
//  Messager
//
//  Created by Wang, Chongbei on 3/9/21.
//  Copyright © 2021 com.wchb. All rights reserved.
//

import Foundation
import FirebaseStorage
import ProgressHUD

let storage = Storage.storage()

class FileStorage {
    
    class func uploadImage(_ image: UIImage, directory: String, completion: @escaping (_ documentLink: String?)-> Void) {
        
        let storageRef = storage.reference(forURL: kFILEREFERENCE).child(directory)
        
        let imageData = image.jpegData(compressionQuality: 0.6)
        
        var task: StorageUploadTask!
        
        task = storageRef.putData(imageData!, metadata: nil, completion: {
            (metadata, error) in
            
            task.removeAllObservers()
            ProgressHUD.dismiss()
            
            if error != nil {
                print("error uploading image \(error!.localizedDescription)")
                return
            }
            
            storageRef.downloadURL{(url,error) in
                guard let downloadUrl = url else {
                    completion(nil)
                    return
                }
                
                completion(downloadUrl.absoluteString)
            }
            
            task.observe(StorageTaskStatus.progress){
                (snapshot) in
                let progress = snapshot.progress!.completedUnitCount / snapshot.progress!.totalUnitCount
                
                ProgressHUD.showProgress(CGFloat(progress))
            }
            
        })
    }
}
