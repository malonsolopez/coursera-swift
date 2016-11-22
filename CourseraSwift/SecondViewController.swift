//
//  SecondViewController.swift
//  CourseraSwift
//
//  Created by Maria Alonso on 11/17/16.
//  Copyright © 2016 Maria Alonso. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onCourseraButtonClick(sender: UIButton) {
        let courseraURL = "http://www.coursera.org"
        UIApplication.sharedApplication().openURL(NSURL(string: courseraURL)!)
    }

}

