//
//  RecentChat.swift
//  Messager
//
//  Created by Wang, Chongbei on 3/15/21.
//  Copyright © 2021 com.wchb. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct RecentChat: Codable {
    
    var id = ""
    var chatRoomId = ""
    var senderId = ""
    var senderName = ""
    var receiverId = ""
    var receiverName = ""
    @ServerTimestamp var date = Date()
    var memberIds = [""]
    var lastMessage = ""
    var unreadCounter = 0
    var avatarLink = ""
}
