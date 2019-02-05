//
//  StarshipViewController.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 05/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import UIKit

class StarshipViewController: UIViewController {
    
    @IBOutlet weak var lbStarshipName: UILabel!
    @IBOutlet weak var lbModel: UILabel!
    @IBOutlet weak var lbManufacturer: UILabel!
    @IBOutlet weak var lbMaxSpeed: UILabel!
    @IBOutlet weak var lbCrew: UILabel!
    @IBOutlet weak var lbPassengers: UILabel!
    @IBOutlet weak var lbCargoCapacity: UILabel!
    @IBOutlet weak var lbClass: UILabel!
    
    var starship : Starship?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        lbStarshipName.text = starship?.name
        lbModel.text = starship?.model
        lbManufacturer.text = starship?.manufacturer
        lbMaxSpeed.text = starship?.max_atmosphering_speed
        lbCrew.text = starship?.crew
        lbPassengers.text = starship?.passengers
        lbCargoCapacity.text = starship?.cargo_capacity
        lbClass.text = starship?.starship_class
    }
    

    @IBAction func Close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
