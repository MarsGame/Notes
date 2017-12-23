//
//  ViewController.swift
//  Notes
//
//  Created by YuKunquan on 27/07/2017.
//  Copyright © 2017 YuKunquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*let bounds = self.view.bounds
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        context?.translateBy(x: -self.view.frame.origin.x, y: -self.view.frame.origin.y);
        
        self.view.layer.render(in: context!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        context?.restoreGState()
        UIGraphicsEndImageContext()
        
        print(image!)
        
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)*/
        print("Hello World!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

