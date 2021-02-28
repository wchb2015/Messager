//
//  FCollectionReference.swift
//  Messager
//
//  Created by Wang, Chongbei on 2/28/21.
//  Copyright © 2021 com.wchb. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String{
    case User
    case Recent
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
