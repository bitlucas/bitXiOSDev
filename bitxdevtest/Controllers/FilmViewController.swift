//
//  FilmViewController.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 05/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {
    
    @IBOutlet weak var lbFilmTitle: UILabel!
    @IBOutlet weak var lbOpeningCrawl: UILabel!
    @IBOutlet weak var lbDirector: UILabel!
    @IBOutlet weak var lbProducer: UILabel!
    @IBOutlet weak var lbReleaseDate: UILabel!
    
    var film : Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        guard let episode = film!.episode_id else { return }
        guard let title = film!.title else { return }
        lbFilmTitle.text = "Episode \(episode): \(title)"
        lbOpeningCrawl.text = film?.opening_crawl
        lbDirector.text = film?.director
        lbProducer.text = film?.producer
        lbReleaseDate.text = film?.release_date
    }
    
    @IBAction func Close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
