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
    @IBOutlet weak var btnSpecie: UIButton!
    
    var sectionName = ["Films", "Specie", "Vehicles", "Starships"]
    
//    var activityIndicator : UIActivityIndicatorView = {
//        var ai = UIActivityIndicatorView()
//        ai.style = .gray
//        ai.hidesWhenStopped = true
//        ai.translatesAutoresizingMaskIntoConstraints = false
//        return ai
//    }()
//

    var character : Character?
    var planet: Planet?
    var film : Film?
    var specie : Specie?
    var vehicle : Vehicle?
    var starship : Starship?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbName.text = character?.name
        lbMass.text = character?.mass
        lbHeight.text = character?.height
        lbBirthYear.text = character?.birth_year
        lbGender.text = character?.gender
        
        getPlanet()
        getSpecie()
        
        btnHomeworld.isEnabled = false
        btnHomeworld.setTitle("Loading...", for: .disabled)
        btnSpecie.isEnabled = false
        btnSpecie.setTitle("", for: .disabled)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionName.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return (character?.films?.count)!
        }
        if section == 1 {
            return character?.species?.count ?? 0
        }
        if section == 2 {
            return character?.vehicles?.count ?? 0
        }
        return character?.starships?.count ?? 0
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
       
        //film
        if indexPath.section == 0 {
            cell.textLabel?.text = ""
            Service.urlString = character?.films![indexPath.row]
            Service.getFilm { (film) in
                self.film = film
                DispatchQueue.main.async {
                    cell.textLabel?.text = "Episode \(self.film!.episode_id!): \(self.film!.title!)"
                }
            }
        }
        
        //specie
        if indexPath.section == 1 {
            cell.textLabel?.text = ""
            Service.urlString = character?.species![indexPath.row]
            Service.getSpecie { (specie) in
                DispatchQueue.main.async {
                    cell.textLabel?.text = specie.name
                }
            }
        }
        //vehicle
        if indexPath.section == 2 {
            cell.textLabel?.text = ""
            Service.urlString = character?.vehicles![indexPath.row]
            Service.getVehicle { (vehicle) in
                DispatchQueue.main.async {
                    cell.textLabel?.text = vehicle.name
                }
            }
        }
        //starship
        if indexPath.section == 3 {
            cell.textLabel?.text = ""
            Service.urlString = character?.starships![indexPath.row]
            Service.getStarship { (starship) in
                DispatchQueue.main.async {
                    cell.textLabel?.text = starship.name
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print(character?.films![indexPath.row])
        }
        if indexPath.section == 1 {
            print(character?.species![indexPath.row])
        }
        if indexPath.section == 2 {
            print(character?.vehicles![indexPath.row])
        }
        if indexPath.section == 3 {
            print(character?.starships![indexPath.row])
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionName[section]
    }
    
    
//    func getFilmTitle(searchUrl: String) {
//        Service.urlString = searchUrl
//            Service.getFilm { (film) in
//                self.filmArray.append(film.title!)
//                print(self.filmArray)
//        }
//    }
   
    
    
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
    
    private func getSpecie() {
        Service.urlString = character?.species?.first
        Service.getSpecie { (specie) in
            self.specie = specie
            DispatchQueue.main.async {
                self.btnSpecie.isEnabled = true
                self.btnSpecie.setTitle(specie.name, for: .normal)
            }
        }
    }
    
    @IBAction func showHomeworldDetail(_ sender: UIButton) {
        if let planetViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlanetViewController") as? PlanetViewController {
            planetViewController.planet = self.planet
            
            DispatchQueue.main.async {
                self.present(planetViewController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func showSpecieDetail(_ sender: UIButton) {
        if let specieViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SpecieViewController") as? SpecieViewController {
            specieViewController.specie = self.specie
            
            DispatchQueue.main.async {
                self.present(specieViewController, animated: true, completion: nil)
            }
        }
    }
    
    
}
