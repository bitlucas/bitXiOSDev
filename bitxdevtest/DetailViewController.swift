//
//  DetailViewController.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 02/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbMass: UILabel!
    @IBOutlet weak var lbHeight: UILabel!
    @IBOutlet weak var lbBirthYear: UILabel!
    @IBOutlet weak var lbPlanet: UILabel!
    
    @IBOutlet weak var lbGender: UILabel!
    
    var character : Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbName.text = character?.name
        //title = character?.name
        lbMass.text = character?.mass
        lbHeight.text = character?.height
        lbBirthYear.text = character?.birth_year
        lbGender.text = character?.gender
        lbPlanet.text = character?.homeworld
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    

    

}
