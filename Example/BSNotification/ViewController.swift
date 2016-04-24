//
//  ViewController.swift
//  BSNotification
//
//  Created by Bobby Stenly on 04/24/2016.
//  Copyright (c) 2016 Bobby Stenly. All rights reserved.
//

import UIKit
import BSNotification

class ViewController: UIViewController {

    @IBOutlet weak var btnClickMe: UIButton!
    var isTop = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClickMeTouched(sender: AnyObject) {
        if self.isTop {
            BSNotification.show("Click Me Button Touched", viewController: self, position: .Top)
        }
        else{
            BSNotification.show("Click Me Button Touched", viewController: self)
        }
        
        self.isTop = !self.isTop
    }
}

