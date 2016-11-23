//
//  NewsFeedController.swift
//  CourseraSwift
//
//  Created by Maria Alonso on 11/21/16.
//  Copyright © 2016 Maria Alonso. All rights reserved.
//

import UIKit

class NewsFeedController: UITableViewController {
    
    var newsFeed: NewsFeed? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=kittens")
        self.updateFeed(url!, completion: { (feed) -> Void in
            self.newsFeed = feed
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeed?.newsFeed.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "NewsFeedCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! NewsFeedCell
        
        // Fetches the appropriate news for the data source layout.
        let thisNew = newsFeed!.newsFeed[indexPath.row]
        cell.newsTitle.text = thisNew.title
        cell.newsSnippet.text = thisNew.snippet
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  /*segue.identifier == "NewsDetailSegue",*/
            let destination = segue.destinationViewController as? NewsDetail,
            let selectedRow = tableView.indexPathForSelectedRow?.row
        {
            
            destination.newsURL = (self.newsFeed?.newsFeed[selectedRow].link)!
        }
    }
    
    func updateFeed(url: NSURL, completion: (feed: NewsFeed?) -> Void) {
        let request = NSURLRequest(URL: url)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error == nil && data != nil {
                let feed = NewsFeed(data: data!, theTopic: "kittens")
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    completion(feed: feed)
                })
            }
            
        }
        
        task.resume()
    }
    
}
