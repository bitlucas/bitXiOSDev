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
    
    let logoImage = UIImage(named: "star-wars-logo")!
    let navBarBackground = UIImage(named: "navBarBackground")!
    
    var errorMsg : UILabel = {
     var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nenhum resultado encontrado."
        label.font = UIFont(name: "Helvetica-Light", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
    
    private func setupNavigationBar() {
        
        let starWarsLogoImageView = UIImageView(image: logoImage)
        
        let bannerWidth = navigationController!.navigationBar.frame.size.width
        let bannerHeight = navigationController!.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - logoImage.size.width / 2
        let bannerY = bannerHeight / 2 - logoImage.size.height / 2
        
        starWarsLogoImageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        starWarsLogoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = starWarsLogoImageView
        navigationController?.navigationBar.setBackgroundImage(navBarBackground, for: .default)
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(patternImage: navBarBackground)
        self.view.addSubview(errorMsg)
        
        tfCharacterName.tintColor = UIColor.white
        tfCharacterName.backgroundColor = UIColor.black
        tfCharacterName.textColor = UIColor.white
        tfCharacterName.layer.borderWidth = 1
        tfCharacterName.layer.borderColor = UIColor.yellow.cgColor
        tfCharacterName.clipsToBounds = true
        tfCharacterName.layer.cornerRadius = 15
        
        btnSearch.backgroundColor = UIColor.black
        btnSearch.tintColor = UIColor.yellow
        btnSearch.layer.borderWidth = 1
        btnSearch.layer.borderColor = UIColor.yellow.cgColor
        btnSearch.clipsToBounds = true
        btnSearch.layer.cornerRadius = 5
        
        errorMsg.isHidden = true
//        errorMsg.topAnchor.constraint(equalTo: self.tfCharacterName.bottomAnchor, constant: 6)
        errorMsg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        errorMsg.bottomAnchor.constraint(equalTo: btnSearch.topAnchor, constant: -40).isActive = true
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
        
        errorMsg.isHidden = true
        activityIndicator.startAnimating()
        isSearching()
        
        Service.getCharacter { (responseBody) in
            if (responseBody.results?.isEmpty)! {
                // exibir mensagem de nenhum usuário encontrado
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.errorMsg.isHidden = false
                    self.isSearching()
                }
            } else if let characterViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterViewController") as? CharacterViewController {
                characterViewController.character = responseBody.results?.first
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.navigationController?.pushViewController(characterViewController, animated: true)
                }
            }
            //print(responseBody.results)
        }
    }
    

}
