//
//  PostCell.swift
//  Redddd
//
//  Created by Badi Parvaneh on 12/15/18.
//  Copyright © 2018 Badi Parvaneh. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var username: UILabel!
    
    func setPost(post: Post) {
        username.text = post.username
        message.text = post.msg
        message.numberOfLines = 0
    }
    
}
