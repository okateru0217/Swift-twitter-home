//
//  CustomTableViewCell.swift
//  Twitter-Home
//
//  Created by 岡澤輝明 on 2021/03/14.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var contributorNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak private var reTweetIcon: UIButton!
    @IBOutlet weak private var niceIcon: UIButton!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // リツイートボタン押下時の処理
    private var isReTweetIconColor = true
    @IBAction func reTweetButton(_ sender: Any) {
        toggleReTweetIconLook()
    }
    
    // いいねボタン押下時の処理
    private var isNiceIconColor = true
    @IBAction func niceButton(_ sender: Any) {
        toggleNiceButtonLook()
    }
    
    func toggleReTweetIconLook() {
        reTweetIcon.tintColor = isReTweetIconColor ? .systemGreen : .lightGray
        isReTweetIconColor.toggle()
    }
    
    func toggleNiceButtonLook() {
        let heart = UIImage(systemName: "heart")
        let heartFill = UIImage(systemName: "heart.fill")
        isNiceIconColor ? niceIcon.setImage(heartFill, for: .normal) : niceIcon.setImage(heart, for: .normal)
        niceIcon.tintColor = isNiceIconColor ? .systemPink : .lightGray
        isNiceIconColor.toggle()
    }
}
