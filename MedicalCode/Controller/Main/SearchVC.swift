//
//  SearchVC.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/20/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpViews()
    }

    // MARK: - Helper functions
    private func setUpViews() {
        self.setViewControllerTitle(to: "بحث")
        self.addNavItems()
    }
    @IBAction func findDoctorBtnPressed(_ sender: UIButton) {
        let searchResultVC = UIStoryboard(name: "SearchResults", bundle: nil).instantiateViewController(withIdentifier: "SearchResultsVC") as! SearchResultsVC
        self.navigationController?.pushViewController(searchResultVC, animated: true)
    }
}
