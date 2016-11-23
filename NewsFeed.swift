//
//  NewsFeed.swift
//  CourseraSwift
//
//  Created by Maria Alonso on 11/22/16.
//  Copyright © 2016 Maria Alonso. All rights reserved.
//

import Foundation

func fixJsonData (data: NSData) -> NSData {
    var dataString = String(data: data, encoding: NSUTF8StringEncoding)!
    dataString = dataString.stringByReplacingOccurrencesOfString("\\'", withString: "'")
    return dataString.dataUsingEncoding(NSUTF8StringEncoding)!
    
}

class NewsFeed {
    
    let newsFeed: [News]
    let topic: String
    
    init(theFeed: [News], theTopic: String){
        self.newsFeed = theFeed
        self.topic = theTopic
    }
    
    convenience init? (data: NSData, theTopic: String) {
        var newItems = [News]()
        
        let fixedData = fixJsonData(data)
        
        var jsonObject: Dictionary<String, AnyObject>?
        
        do {
            jsonObject = try NSJSONSerialization.JSONObjectWithData(fixedData, options: NSJSONReadingOptions(rawValue: 0)) as? Dictionary<String,AnyObject>
        } catch {
            //TODO
        }
        
        guard let feedRoot = jsonObject else {
            return nil
        }
        
        guard let responseData = feedRoot["responseData"] as? Dictionary<String,AnyObject>  else {
            return nil
        }
        
        guard let items = responseData["entries"] as? Array<AnyObject> else{
            return nil
        }
        
        
        for item in items {
            
            guard let itemDict = item as? Dictionary<String,AnyObject> else {
                continue
            }
//            guard let url = itemDict["url"] as? NSURL else {
//                continue
//            }
//            
//            guard let title = itemDict["title"] as? String else {
//                continue
//            }
//            
//            guard let url = NSURL(string: urlString) else {
//                continue
//            }
            
            let url = itemDict["url"] as? String
            let title = itemDict["title"] as? String
            let snippet = itemDict["contentSnippet"] as? String
            let link = itemDict["link"] as? String
            
            newItems.append(News(url: url!, title: title!, snippet: snippet!, link: link!))
            
        }
        
        self.init(theFeed: newItems, theTopic: theTopic)
    }
    
}
