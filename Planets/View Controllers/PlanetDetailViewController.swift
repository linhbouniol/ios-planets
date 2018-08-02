//
//  PlanetDetailViewController.swift
//  Planets
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    // This is so you can show specific planet
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    // This is so you can modify/add planet
    var planetController: PlanetController?

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    func updateViews() {
        guard let planet = planet else { return }
        
        textLabel?.text = planet.name
        imageView?.image = planet.image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
}
