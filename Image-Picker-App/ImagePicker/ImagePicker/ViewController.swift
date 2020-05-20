//
//  ViewController.swift
//  ImagePicker
//
//  Created by Hamza Khalid on 20/05/2020.
//  Copyright © 2020 Hamza Khalid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pickImage(_ sender: UIButton) {
        
      //---Image Picker Controller
        
      let nextController = UIImagePickerController()
      self.present(nextController, animated: true, completion: nil)
        
       //---Activity View Controller
        
       /* let image = UIImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)*/
        
        //---Alert View Controller
        
        /*let controller = UIAlertController()
        controller.title = "Test Alert"
        controller.message = "This is a test"

        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default) { action in self.dismiss(animated: true, completion: nil)
        }

        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)*/
    }
    
}

