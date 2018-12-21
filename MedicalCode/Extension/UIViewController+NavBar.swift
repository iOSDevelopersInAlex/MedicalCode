//
//  UIViewController+NavBar.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/16/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showAlert(title: String, message: String, okTitle: String = "OK", okHandler: ((UIAlertAction)->Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okTitle, style: .cancel, handler: okHandler))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setViewControllerTitle(to title: String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 25))
        titleLabel.font = UIFont(name:"GESSTextMedium-Medium" , size: 15)
        titleLabel.textAlignment = .center
        titleLabel.text = title
        titleLabel.textColor = UIColor.white
        self.navigationItem.titleView = titleLabel
    }
    
    func addCustomBackButton() {
        let backIcon = UIImage(named: "backArrow")
        let backButton = UIBarButtonItem(image: backIcon, style: .plain, target: self, action:  #selector(backButtonPressed))
        self.navigationItem.rightBarButtonItem = backButton
    }
    func addBackToRootLeftBtn() {
        let backIcon = UIImage(named: "backArrow")
        let backButton = UIBarButtonItem(image: backIcon, style: .plain, target: self, action:  #selector(backButtonPressAction))
        self.navigationItem.rightBarButtonItem = backButton
    }
    func addSettingsBtn() {
        let settingsButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icSettings"), style: .plain, target: self, action:  #selector(settingsButtonPressed))
        self.navigationItem.leftBarButtonItem = settingsButton
    }
    
    func addNavItems(){
        self.addBackToRootLeftBtn()
        self.addSettingsBtn()
    }
    
    @objc func backButtonPressAction() {
        let servicesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ServicesVC")
        AppDelegate.shared().window?.rootViewController = servicesVC
    }
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func settingsButtonPressed() {
//        let settingsVC = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "SettingsTableVC") as! SettingsTableVC
//        let settingsNav = UINavigationController(rootViewController: settingsVC)
//        self.present(settingsNav, animated: true, completion: nil)
    }
}
