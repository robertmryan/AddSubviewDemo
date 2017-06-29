//
//  ViewController.swift
//  AddSubviewDemo
//
//  Created by Robert Ryan on 6/29/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleView: SampleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for giggles and grins, let's print the list of friends views
        
        print(sampleView.friends)
    }

}

