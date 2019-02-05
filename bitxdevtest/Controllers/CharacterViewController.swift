//
//  DetailViewController.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 02/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lbMass: UILabel!
    @IBOutlet weak var lbHeight: UILabel!
    @IBOutlet weak var lbBirthYear: UILabel!
    @IBOutlet weak var btnHomeworld: UIButton!
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var btnSpecie: UIButton!
    
    var sectionName = ["Films", "Vehicles", "Starships"]
    
    var character : Character?
    var planet: Planet?
    var filmArray : [Film] = []
    var specie : Specie?
    var vehicle : Vehicle?
    var starship : Starship?
    
    var filmDictionary = [String : Film]()
    var vehicleDictionary = [String : Vehicle]()
    var starshipDictionary = [String : Starship]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let imgBackground = UIImage(named: "navBarBackground")
        self.navigationController?.navigationBar.backgroundColor = UIColor(patternImage: imgBackground!)
        self.navigationController?.navigationBar.tintColor = UIColor.yellow
        
        title = character?.name
        //lbName.text = character?.name
        lbMass.text = character?.mass
        lbHeight.text = character?.height
        lbBirthYear.text = character?.birth_year
        lbGender.text = character?.gender
        
        getPlanet()
        getSpecie()
        
        btnHomeworld.isEnabled = false
        btnHomeworld.setTitle("Loading...", for: .disabled)
        btnSpecie.isEnabled = false
        btnSpecie.setTitle("Loading...", for: .disabled)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionName.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return (character?.films?.count)!
        }
        if section == 1 {
            return character?.vehicles?.count ?? 0
        }
        return character?.starships?.count ?? 0
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
       
        //film
        if indexPath.section == 0 {
            Service.urlString = character?.films![indexPath.row]
            if let filmCache = filmDictionary[(character?.films![indexPath.row])!]{
                cell.textLabel?.text = "Episode \(filmCache.episode_id!): \(filmCache.title!)"
            } else {
                Service.getFilm { (film) in
                    self.filmDictionary[(self.character?.films![indexPath.row])!] = film
                    DispatchQueue.main.async {
                        cell.textLabel?.text = "Episode \(film.episode_id!): \(film.title!)"
                    }
                }
            }
        }

        //vehicle
        if indexPath.section == 1 {
            Service.urlString = character?.vehicles![indexPath.row]
            if let vehicleCache = vehicleDictionary[(character?.vehicles![indexPath.row])!]{
                cell.textLabel?.text = vehicleCache.name
            } else {
                Service.getVehicle { (vehicle) in
                    self.vehicleDictionary[(self.character?.vehicles![indexPath.row])!] = vehicle
                    DispatchQueue.main.async {
                        cell.textLabel?.text = vehicle.name
                    }
                }
            }
        }
        //starship
        if indexPath.section == 2 {
            Service.urlString = character?.starships![indexPath.row]
            if let starshipCache = starshipDictionary[(character?.starships![indexPath.row])!] {
                cell.textLabel?.text = starshipCache.name
            } else {
                Service.getStarship { (starship) in
                    self.starshipDictionary[(self.character?.starships![indexPath.row])!] = starship
                    DispatchQueue.main.async {
                        cell.textLabel?.text = starship.name
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            if let filmViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FilmViewController") as? FilmViewController {
                filmViewController.film = filmDictionary[(character?.films![indexPath.row])!]
                
                DispatchQueue.main.async {
                    self.present(filmViewController, animated: true, completion: nil)
                }
            }
        }
        if indexPath.section == 1 {
            if let vehicleViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VehicleViewController") as? VehicleViewController{
                vehicleViewController.vehicle = vehicleDictionary[(character?.vehicles![indexPath.row])!]
                 
                DispatchQueue.main.async {
                    self.present(vehicleViewController, animated: true, completion: nil)
                }
            }
        }
        if indexPath.section == 2 {
            if let starshipViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StarshipViewController") as? StarshipViewController{
                starshipViewController.starship = starshipDictionary[(character?.starships![indexPath.row])!]
                
                DispatchQueue.main.async {
                    self.present(starshipViewController, animated: true, completion: nil)
                }
            }
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
