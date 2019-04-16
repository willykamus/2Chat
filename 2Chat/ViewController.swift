//
//  ViewController.swift
//  2Chat
//
//  Created by William Ching on 2019-04-11.
//  Copyright © 2019 William Ching. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cellid = "CellId"
    
    var rates = [Rate]()
    
    var usernames = ["Willykamus","Ahmed","Sara","Ekam","Vanessa","Sahil"]
    
    var comments = ["the game is a great time killer. some things locked behind pay wall. strategy game do like the step up banners do enjoy the game for what it is worth","Its a really great game, I've had a bunch of diffrent accounts over the years that its been out. But the reason I'm only giving it 3 stars is because of the new key thing, were you have to have keys to play some of the storys. And I don't want to have to wait to have them gifted. I think we should","Wow guy this game is amazing and a lot of fun to play. I also like that you can pick right where left off if you need to close it down. The graphics are bright and look like the show .easy to play. With that being said there is a few things I do not like. The biggest problem i really have is you hav","The animations are pretty simple, some characters look sharper than other, and I would've thought that the new characters would be more buggy than the previous ones, but they're not, they're smooth. getting in-game currency is easy, micro transactions are decent. The only thing that doesn't match th","The game is great, but I don't see why firstly it needs internet/wifi and secondly the app is so big. I'm sure it could do without wifi for those who don't use the shop and Dokkan probably doesn't need that much space. Please find a way ti make it non-wifi or make the app size smaller and I will giv","The rates to actually summon a good fighter are extremely low. No matter now many times you summon, be prepared for rare characters in your 50 gem multi-summons."]
    
    

    @IBOutlet weak var commentsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupData()
        self.commentsTable.delegate = self
        self.commentsTable.rowHeight = UITableView.automaticDimension
        self.commentsTable.estimatedRowHeight = 200
        
    }
    
    func setupData(){
        
        let rating = Rate()
        
        rating.comment = "the game is a great time killer. some things locked behind pay wall. strategy game do like the step up banners do enjoy the game for what it is worth"
        rating.rate = 4.5
        rating.username = "Willykamus"
        
        rates.append(rating)
        
        let rating1 = Rate()
        rating1.comment = "Its a really great game, I've had a bunch of diffrent accounts over the years that its been out. But the reason I'm only giving it 3 stars is because of the new key thing, were you have to have keys to play some of the storys. And I don't want to have to wait to have them gifted. I think we should"
        rating1.rate = 3
        
        rating1.username = "Sara"
        
        rates.append(rating1)
        
        
    }


}


extension ViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .none
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let replyComment = UITableViewRowAction(style: .normal, title: "Reply") {
            (action,indexPath) in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let DvC = storyboard.instantiateViewController(withIdentifier: "ReplyViewController") as! ReplyViewController
            
            let cell = self.commentsTable.cellForRow(at: indexPath) as! CommentTableViewCell
            
            DvC.getComment = cell.commentLabel.text!
            DvC.getUsername = cell.username.text!
            
            self.navigationController?.pushViewController(DvC, animated: true)
            
        }
        
        replyComment.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        
        return [replyComment]
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let cell = tableView.cellForRow(at: indexPath) as! CommentTableViewCell
//        cell.contentView.backgroundColor = #colorLiteral(red: 0.00266837189, green: 0.3425685763, blue: 0.488183856, alpha: 1)
//        cell.commentLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        cell.username.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        
//    }
//    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        
//        let cell = tableView.cellForRow(at: indexPath) as! CommentTableViewCell
//        cell.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        cell.commentLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        cell.username.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//    }
    
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! CommentTableViewCell
        
        cell.username.text = rates[indexPath.row].username
        cell.commentLabel.text = rates[indexPath.row].comment
        cell.commentLabel.numberOfLines = 0
        
        return cell
        
    }
    
}

