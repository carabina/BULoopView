//
//  ViewController.swift
//  BULoopView
//
//  Created by burakustn@gmail.com on 06/23/2017.
//  Copyright (c) 2017 burakustn@gmail.com. All rights reserved.
//

import UIKit
import BULoopView

class ViewController: UIViewController {
    @IBOutlet weak var LoopView: BULoopView!

    
    var arrayLoop:   [LoopItem]    = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         Set the properties
         **/
        LoopView.LoopItemWidth = 180
        LoopView.LoopItemMargin = 30
        
        /*
         Create an LoopItem array and fill it
         **/
        for i in 0..<10{
            let item = LoopItem.init(_name: "Test\(i)", _photoPath: "https://burakustn.com/assets/images/logo.png")
            self.arrayLoop.append(item!)
        }
        
        /*
         Load the BULoopView
         **/
        self.LoopView.loadLoopView(LoopArray: self.arrayLoop)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

