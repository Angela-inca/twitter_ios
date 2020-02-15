//
//  TweetCell.swift
//  Twitter
//
//  Created by angela on 2/7/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweet: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetId, success:{ self.setRetweeted(_isRetweeted: true)}, failure: {(error) in
            print("Not succeed \(error)")
        })
        
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if(tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success:{ self.setFavorite(_isFavorited: true)}, failure: { (error) in
                print("Not succeed \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetId, success:{ self.setFavorite(_isFavorited: false)}, failure: { (error) in
                print("Not succeed \(error)")
            })
            
        }
    }
    var favorited: Bool = false
    var tweetId: Int = -1
    func setRetweeted(_isRetweeted:Bool){
        if (_isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
                       retweetButton.isEnabled = true
        }
    }
    func setFavorite(_isFavorited:Bool){
        favorited = _isFavorited
        if(favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"),for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"),for: UIControl.State.normal)
            }
            
        }
        
    }



