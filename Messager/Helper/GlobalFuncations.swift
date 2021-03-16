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

func timeElapsed(_ date: Date) -> String {

    let seconds = Date().timeIntervalSince(date)

    var elapsed = ""

    if seconds < 60 {
        elapsed = "Just now"

    } else if seconds < 60 * 60 {

        let minutes = Int(seconds / 60)
        let minText = minutes > 1 ? "mins" : "min"
        elapsed = "\(minutes) \(minText)"

    } else if seconds < 24 * 60 * 60 {

        let hours = Int(seconds / (60 * 60))
        let hourText = hours > 1 ? "hours" : "hour"
        elapsed = "\(hours) \(hourText)"

    } else {
        elapsed = date.longDate()
    }

    return elapsed
}
