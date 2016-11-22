//
//  NewsFeedCell.swift
//  CourseraSwift
//
//  Created by Maria Alonso on 11/21/16.
//  Copyright © 2016 Maria Alonso. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {
    
    @IBOutlet var newsTitle: UILabel!

    @IBOutlet var newsSnippet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
