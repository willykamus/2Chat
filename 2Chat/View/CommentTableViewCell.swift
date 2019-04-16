//
//  CommentTableViewCell.swift
//  2Chat
//
//  Created by William Ching on 2019-04-15.
//  Copyright © 2019 William Ching. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContainer: UIView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor = selected ? #colorLiteral(red: 0.00266837189, green: 0.3425685763, blue: 0.488183856, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.username.textColor = selected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.commentLabel.textColor = selected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        // Configure the view for the selected state
    }

}
