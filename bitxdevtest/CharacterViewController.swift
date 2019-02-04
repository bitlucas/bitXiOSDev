//
//  DetailViewController.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 02/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbMass: UILabel!
    @IBOutlet weak var lbHeight: UILabel!
    @IBOutlet weak var lbBirthYear: UILabel!
    @IBOutlet weak var btnHomeworld: UIButton!
    @IBOutlet weak var lbGender: UILabel!
    
//    var activityIndicator : UIActivityIndicatorView = {
//        var ai = UIActivityIndicatorView()
//        ai.style = .gray
//        ai.hidesWhenStopped = true
//        ai.translatesAutoresizingMaskIntoConstraints = false
//        return ai
//    }()
//
    var planet : Planet?
    var character : Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbName.text = character?.name
        //title = character?.name
        lbMass.text = character?.mass
        lbHeight.text = character?.height
        lbBirthYear.text = character?.birth_year
        lbGender.text = character?.gender
        btnHomeworld.isEnabled = false
        btnHomeworld.setTitle("Loading...", for: .disabled)
        getPlanet()
    }
    
    func showLoading() {
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
   // downloading planet data
   private func getPlanet() {
        Service.urlString = character?.homeworld
        Service.getPlanet { (planet) in
            self.planet = planet
            DispatchQueue.main.async {
                self.btnHomeworld.isEnabled = true
                self.btnHomeworld.setTitle(planet.name, for: .normal)
            }
        }
    }
    
    @IBAction func HomeworldDetail(_ sender: UIButton) {
        if let planetViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlanetViewController") as? PlanetViewController {
            planetViewController.planet = self.planet
            DispatchQueue.main.async {
                self.present(planetViewController, animated: true, completion: nil)
            }
        }

        
        
    }
}
