//
//  ViewController.swift
//  ClickCounter
//
//  Created by Hamza Khalid on 20/05/2020.
//  Copyright © 2020 Hamza Khalid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    @IBOutlet var label : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        /* ALTERNATIVELY SETTING UP UI ELEMENTS WITH CODE
         
        //Label
        let label = UILabel()
        label.frame = CGRect(x:150, y:150, width:60, height:60)
        label.text = "0"
        self.label = label
        view.addSubview(label)
        
        //Button
        let button = UIButton()
        button.frame = CGRect(x:150, y:250, width:60, height:60)
        button.setTitle("click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControl.Event.touchUpInside)
         
        */
    }
    
    //@objc
    @IBAction func incrementCount(){
               self.count += 1
               self.label.text = "\(self.count)"
           }

   
}

