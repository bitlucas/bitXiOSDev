//
//  VehicleViewController.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 05/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import UIKit

class VehicleViewController: UIViewController {

    @IBOutlet weak var lbModel: UILabel!
    @IBOutlet weak var lbManufacturer: UILabel!
    @IBOutlet weak var lbClass: UILabel!
    @IBOutlet weak var lbCargoCapacity: UILabel!
    @IBOutlet weak var lbCrew: UILabel!
    @IBOutlet weak var lbMaxSpeed: UILabel!
    @IBOutlet weak var lbName: UILabel!
   
    var vehicle : Vehicle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        lbName.text = vehicle?.name
        lbModel.text = vehicle?.model
        lbManufacturer.text = vehicle?.manufacturer
        lbMaxSpeed.text = vehicle?.max_atmosphering_speed
        lbCrew.text = vehicle?.crew
        lbCargoCapacity.text = vehicle?.cargo_capacity
        lbClass.text = vehicle?.vehicle_class
    }


    @IBAction func Close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
