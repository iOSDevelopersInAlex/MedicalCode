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
    
    // MARK: - Helper function
    func presentByServiceId(id: Int) {
        let tabBar = TabBarVC()
        let searchNav = tabBar.viewControllers![0] as! UINavigationController
        let searchVC = searchNav.viewControllers[0] as! SearchVC
        searchVC.serviceId = id
        self.present(tabBar, animated: true, completion: nil)
    }
    
    
    @IBAction func humanMedicineBtnPressed(_ sender: UIButton) {
        presentByServiceId(id: sender.tag)
    }
    @IBAction func mriBtnPressed(_ sender: UIButton) {
        presentByServiceId(id: sender.tag)
    }
    @IBAction func homeNurse(_ sender: UIButton) {
//        let homeNurseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNurseVC")
//        self.present(UINavigationController(rootViewController: homeNurseVC), animated: true, completion: nil)
    }
    @IBAction func veterinary(_ sender: UIButton) {
        presentByServiceId(id: sender.tag)
    }
}

