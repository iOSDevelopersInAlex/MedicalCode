//
//  ViewController.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/16/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import UIKit

class ServicesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func humanMedicineBtnPressed(_ sender: UIButton) {
        let tabBar = TabBarVC()
        self.present(tabBar, animated: true, completion: nil)
    }
}

