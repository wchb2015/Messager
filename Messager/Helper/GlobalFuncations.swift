//
//  GlobalFuncations.swift
//  Messager
//
//  Created by Wang, Chongbei on 3/10/21.
//  Copyright © 2021 com.wchb. All rights reserved.
//

import Foundation

//https://firebasestorage.googleapis.com/v0/b/messager-e0001.appspot.com/o/Avatars%2F_fDaiSRc1bPWy0wGdxWZapiVpxyK2.jpg?alt=media&token=cd94cd4e-b438-4a9c-9a0c-bc8a4a7579af

func fileNameFrom(fileUrl: String) -> String {
    let name = ((fileUrl.components(separatedBy: "_").last)?.components(separatedBy: "?").first!)?.components(separatedBy: ".").first!
    
    return name!
}
