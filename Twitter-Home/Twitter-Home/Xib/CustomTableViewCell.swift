//
//  CustomTableViewCell.swift
//  Twitter-Home
//
//  Created by 岡澤輝明 on 2021/03/14.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var contributorIcon: UIImageView!
    @IBOutlet weak var contributorNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var replyIcon: UIImageView!
    @IBOutlet weak var reTweetIcon: UIImageView!
    @IBOutlet weak var likeIcon: UIImageView!
    @IBOutlet weak var shareIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
