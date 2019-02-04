//
//  MainViewController.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 02/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tfCharacterName: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnSearch: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

       btnSearch.isEnabled = true
    }
    
    func isSearching() {
        if activityIndicator.isAnimating {
            self.btnSearch.isEnabled = false
        } else {
            self.btnSearch.isEnabled = true
        }
    }
    
    @IBAction func SearchCharacter(_ sender: UIButton) {
        guard let searchText = tfCharacterName.text?.replacingOccurrences(of: " ", with: "+") else { return }
        Service.urlString = "https://swapi.co/api/people/?search=" + searchText
        
        activityIndicator.startAnimating()
        isSearching()
        
        Service.getCharacter { (responseBody) in
            if (responseBody.results?.isEmpty)! {
                // exibir mensagem de nenhum usuário encontrado
                print("Nenhum resultado encontrado")
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.isSearching()
                }
            } else if let characterViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterViewController") as? CharacterViewController {
                characterViewController.character = responseBody.results?.first
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.navigationController?.pushViewController(characterViewController, animated: true)
                }
            }
            print(responseBody.results)
        }
    }
    

}
