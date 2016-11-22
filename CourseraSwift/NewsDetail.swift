//
//  NewsDetail.swift
//  CourseraSwift
//
//  Created by Maria Alonso on 11/21/16.
//  Copyright © 2016 Maria Alonso. All rights reserved.
//

import UIKit

class NewsDetail: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    internal var newsURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.loadRequest(NSURLRequest(URL: NSURL(string: newsURL)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
