//
//  SpecieViewController.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 05/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import UIKit

class SpecieViewController: UIViewController {

    @IBOutlet weak var lbSpecieName: UILabel!
    @IBOutlet weak var lbLanguage: UILabel!
    @IBOutlet weak var lbLifespan: UILabel!
    @IBOutlet weak var lbEyeColor: UILabel!
    @IBOutlet weak var lbSkinColor: UILabel!
    @IBOutlet weak var lbHeight: UILabel!
    @IBOutlet weak var lbClassification: UILabel!
    
    var specie : Specie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbSpecieName.text = specie?.name
        lbLanguage.text = specie?.language
        lbLifespan.text = specie?.average_lifespan
        lbEyeColor.text = specie?.eye_colors
        lbSkinColor.text = specie?.skin_colors
        lbHeight.text = specie?.average_height
        lbClassification.text = specie?.classification
        
    }

    @IBAction func Close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
