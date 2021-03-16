//
//  RecentTableViewCell.swift
//  Messager
//
//  Created by Wang, Chongbei on 3/15/21.
//  Copyright © 2021 com.wchb. All rights reserved.
//

import UIKit

class RecentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var unreadCounterLabel: UILabel!
    @IBOutlet weak var unreadCounterBackgroudView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        unreadCounterBackgroudView.layer.cornerRadius = unreadCounterBackgroudView.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(recent: RecentChat) {
        
        usernameLabel.text = recent.receiverName
        usernameLabel.adjustsFontSizeToFitWidth = true
        usernameLabel.minimumScaleFactor = 0.9
        
        lastMessageLabel.text = recent.lastMessage
        lastMessageLabel.adjustsFontSizeToFitWidth = true
        lastMessageLabel.numberOfLines = 2
        lastMessageLabel.minimumScaleFactor = 0.9
        
        if recent.unreadCounter != 0 {
            self.unreadCounterLabel.text = "\(recent.unreadCounter)"
            self.unreadCounterBackgroudView.isHidden = false
        } else {
            self.unreadCounterBackgroudView.isHidden = true
        }
        
        setAvatarLink(avatarLink: recent.avatarLink)
        dateLabel.text = timeElapsed(recent.date ?? Date())
        dateLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setAvatarLink(avatarLink: String) {
        if avatarLink != "" {
            FileStorage.downloadImage(imageUrl: avatarLink) {
                (avatarImage) in
                self.avatarImageView.image = avatarImage?.circleMasked
            }
        } else {
            self.avatarImageView.image = UIImage(named: "avatar")?.circleMasked
        }
    }
}
