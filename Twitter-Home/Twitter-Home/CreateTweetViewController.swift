//
//  createTweetViewController.swift
//  Twitter-Home
//
//  Created by 岡澤輝明 on 2021/03/21.
//

import UIKit

class createTweetViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak private var tweetContentView: UITextView!
    @IBOutlet weak private var postTweetButton: UIButton!
    
    public var receiveTweetItem: [[String:String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateSelf()
        roundPostTweetButton()
        notPressTweetButton()
        // Do any additional setup after loading the view.
    }
    
    func delegateSelf() {
        tweetContentView.delegate = self
    }
    func roundPostTweetButton() {
        self.postTweetButton.layer.cornerRadius = 15.0
    }
    // 画面遷移時、ツイートボタンを押せないようにする
    func notPressTweetButton() {
        postTweetButton.backgroundColor = .systemGray
        postTweetButton.isEnabled = false
    }

    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func postTweet(_ sender: Any) {
        submitTweet()
    }
    
    // ツイート内容が入力されていない場合、ツイートできないようにする
    func textViewDidChange(_ textView: UITextView) {
        let isTweetNone = tweetContentView.text.count == 0
        postTweetButton.backgroundColor = isTweetNone ? .systemGray : .systemBlue
        postTweetButton.isEnabled = !isTweetNone
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
    
    func submitTweet() {
        receiveTweetItem?.insert(["contributorName" : "おかざわ", "content" : String(tweetContentView.text)], at: 0)
        let vc = self.presentingViewController as! ViewController
        vc.tweetItem = receiveTweetItem!
        vc.tweetTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .none)
        self.dismiss(animated: true)
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
