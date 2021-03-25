//
//  ViewController.swift
//  Twitter-Home
//
//  Created by 岡澤輝明 on 2021/03/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tweetTableView: UITableView!
    @IBOutlet weak var postTweetButton: UIButton!
    
    var test = "test"
    
    var tweetItem = [
        ["contributorName": "kazamidori", "content": "風見鶏"],
        ["contributorName": "bado", "content": "ばどばど"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.contributorNameLabel.text = self.tweetItem[indexPath.row]["contributorName"]! as String
        cell.tweetContentLabel.text = self.tweetItem[indexPath.row]["content"]! as String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostTweet" {
            let createTweetView = segue.destination as! createTweetViewController
            createTweetView.receiveTweetItem = tweetItem
        }
    }
    
    // ＋ボタン押下時の処理
    @IBAction func creationTweetButton(_ sender: Any) {
        print(tweetItem.count)
    }
}
