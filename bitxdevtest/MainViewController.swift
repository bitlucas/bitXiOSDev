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

        // Do any additional setup after loading the view.
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
        let searchString = "https://swapi.co/api/people/?search=" + searchText
        let searchUrl = URL(string: searchString)
        let session = URLSession.shared
        
        activityIndicator.startAnimating()
        isSearching()
        
        let dataTask = session.dataTask(with: searchUrl!) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                    if response.statusCode == 200 {
                        guard let data = data else { return }
                        do {
                        let responseBody = try JSONDecoder().decode(ResponseBody.self, from: data)
                            if (responseBody.results?.isEmpty)! {
                                // exibir mensagem de nenhum usuário encontrado
                                print("Nenhum resultado encontrado")
                                
                                DispatchQueue.main.async {
                                    self.activityIndicator.stopAnimating()
                                    self.isSearching()
                                }
                            } else if let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                                detailViewController.character = responseBody.results?.first

                                DispatchQueue.main.async {
                                self.activityIndicator.stopAnimating()
                                
                                
                                self.navigationController?.pushViewController(detailViewController, animated: true)
                                    }
                                }
                            
                        print(responseBody)
                        } catch {
                            
                    }
                }
            }
        }
        dataTask.resume()
        
    }
    

}
