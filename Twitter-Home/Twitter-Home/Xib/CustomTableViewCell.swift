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
    @IBOutlet weak var reTweetIcon: UIButton!
    @IBOutlet weak var niceIcon: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // リツイートボタン押下時の処理
    var isReTweetIconColor = true
    @IBAction func reTweetButton(_ sender: Any) {
        if isReTweetIconColor {
            reTweetIcon.tintColor = UIColor.systemGreen
            isReTweetIconColor.toggle()
        } else {
            reTweetIcon.tintColor = UIColor.lightGray
            isReTweetIconColor.toggle()
        }
    }
    
    // いいねボタン押下時の処理
    var isNiceIconColor = true
    @IBAction func niceButton(_ sender: Any) {
        let heart = UIImage(systemName: "heart")
        let heartFill = UIImage(systemName: "heart.fill")
        if isNiceIconColor {
            niceIcon.setImage(heartFill, for: .normal)
            niceIcon.tintColor = UIColor.systemPink
            isNiceIconColor.toggle()
        } else {
            niceIcon.setImage(heart, for: .normal)
            niceIcon.tintColor = UIColor.lightGray
            isNiceIconColor.toggle()
        }
    }
}
