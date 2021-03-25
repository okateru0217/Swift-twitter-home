//
//  createTweetViewController.swift
//  Twitter-Home
//
//  Created by 岡澤輝明 on 2021/03/21.
//

import UIKit

class createTweetViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tweetContentView: UITextView!
    @IBOutlet weak var postTweetButton: UIButton!
    
    var receiveTweetItem: [[String:String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetContentView.delegate = self
        self.postTweetButton.layer.cornerRadius = 15.0
        // 画面遷移時、ツイートボタンを押せないようにする
        postTweetButton.backgroundColor = UIColor.systemGray
        postTweetButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postTweet(_ sender: Any) {
        receiveTweetItem?.insert(["contributorName" : "おかざわ", "content" : String(tweetContentView.text)], at: 0)
        let vc = self.presentingViewController as! ViewController
        vc.tweetItem = receiveTweetItem!
        vc.tweetTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .none)
        self.dismiss(animated: true, completion: nil)
    }
    
    // ツイート内容が入力されていない場合、ツイートできないようにする
    func textViewDidChange(_ textView: UITextView) {
        if tweetContentView.text.count == 0 {
            postTweetButton.backgroundColor = UIColor.systemGray
            postTweetButton.isEnabled = false
        } else {
            postTweetButton.backgroundColor = UIColor.systemBlue
            postTweetButton.isEnabled = true
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if tweetContentView.text == "いまどうしてる？" {
            tweetContentView.text = nil
            tweetContentView.textColor = .darkGray
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if tweetContentView.text.isEmpty {
            tweetContentView.text = "いまどうしてる？"
            tweetContentView.textColor = .darkGray
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
