//
//  ViewController.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/16/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import UIKit

class ServicesVC: UIViewController {
    @IBOutlet var servicesLabels: [UILabel]!
    var services = [Service]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadServices()
    }
    
    // MARK: - Helper functions
    private func loadServices() {
        APIManager.getServices { (error, services) in
            if let error = error {
                self.showAlert(title: "error", message: error)
            } else if let services = services {
                self.services = services
                self.didLoadServices()
            }
        }
    }
    private func didLoadServices() {
        for label in servicesLabels {
            let serviceName = self.getServiceName(by: label.tag)
            label.text = serviceName
        }
    }
    private func getServiceName(by id: Int) -> String {
        guard services.count != 0, let serviceName = services.first(where: {$0.id == id})?.serviceNameA else {
            return "N/A"
        }
        return serviceName
    }
    
    private func presentByServiceId(id: Int) {
        let tabBar = TabBarVC()
        let searchNav = tabBar.viewControllers![0] as! UINavigationController
        let searchVC = searchNav.viewControllers[0] as! SearchVC
        searchVC.serviceId = id
        self.present(tabBar, animated: true, completion: nil)
    }
    
    // MARK: - IBAction functions
    @IBAction func humanMedicineBtnPressed(_ sender: UIButton) {
        presentByServiceId(id: sender.tag)
    }
    @IBAction func mriBtnPressed(_ sender: UIButton) {
        presentByServiceId(id: sender.tag)
    }
    @IBAction func homeNurse(_ sender: UIButton) {
    }
    @IBAction func veterinary(_ sender: UIButton) {
        presentByServiceId(id: sender.tag)
    }
}

