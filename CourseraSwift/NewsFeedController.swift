//
//  NewsFeedController.swift
//  CourseraSwift
//
//  Created by Maria Alonso on 11/21/16.
//  Copyright © 2016 Maria Alonso. All rights reserved.
//

import UIKit

class NewsFeedController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "NewsFeedCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! NewsFeedCell
        
        // Fetches the appropriate news for the data source layout.
        cell.newsTitle.text = "Title"
        cell.newsSnippet.text = "Snippet of this news"
        
        return cell
    }
    
}
