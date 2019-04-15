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

        // Configure the view for the selected state
    }

}
