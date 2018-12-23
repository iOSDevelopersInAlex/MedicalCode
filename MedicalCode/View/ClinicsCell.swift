//
//  ClinicsCell.swift
//  Esptalia-iOS
//
//  Created by ahmedbahnasy on 6/29/18.
//  Copyright © 2018 AhmedBahnasy. All rights reserved.
//

import UIKit
import Cosmos
import MarqueeLabel

class ClinicsCell: UITableViewCell {
    
    
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var doctorName_lbl: MarqueeLabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var doctorTitle_lbl: MarqueeLabel!
    @IBOutlet weak var reviews_lbl: UILabel!
    @IBOutlet weak var subSpecialisties_lb: MarqueeLabel!
    @IBOutlet weak var waitingTime_lbl: UILabel!
    @IBOutlet weak var examinationFees_lbl: UILabel!
    @IBOutlet weak var afterDiscount_lbl: UILabel!
    @IBOutlet weak var address_lbl: MarqueeLabel!
    @IBOutlet weak var addToFavoritesImageView: UIImageView!
    @IBOutlet weak var removeFromFavoritesImageView: UIImageView!
    @IBOutlet weak var viewProfile_Btn: UIButton!
    @IBOutlet weak var bookNow_btn: UIButton!
    @IBOutlet weak var add_remove_btn: UIButton!
    @IBOutlet weak var feesAfterDiscountIcon: UIImageView!
    
    @IBOutlet weak var subSpecialistiesImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.isOpaque = false
        doctorImageView.setRounded(border: true)
        ratingView.settings.updateOnTouch = false
        self.restartMarqueeLabels()
    }
    
    func restartMarqueeLabels() {
        if let doctorNameLabel = self.doctorName_lbl, let doctorTitlelabel = self.doctorTitle_lbl, let subSpecialistyLabel = self.subSpecialisties_lb, let addressLabel = self.address_lbl {
            let marqueeLabels = [doctorNameLabel, doctorTitlelabel, subSpecialistyLabel, addressLabel]
            for label in marqueeLabels {
                label.type = .continuousReverse
                label.speed = .duration(28)
                label.restartLabel()
            }
        }
    }
}
