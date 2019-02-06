//
//  PlanetViewController.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 03/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController {

    
    @IBOutlet weak var lbPlanetName: UILabel!
    @IBOutlet weak var lbClimate: UILabel!
    @IBOutlet weak var lbGravity: UILabel!
    @IBOutlet weak var lbTerrain: UILabel!
    @IBOutlet weak var lbPopulation: UILabel!
    
    
    var planet : Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        lbPlanetName.text = planet?.name
        lbClimate.text = planet?.climate
        lbGravity.text = planet?.gravity
        lbPopulation.text = planet?.population
        lbTerrain.text = planet?.terrain
    }
    
    
    @IBAction func Close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
