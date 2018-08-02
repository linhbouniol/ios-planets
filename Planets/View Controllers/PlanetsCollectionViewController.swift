//
//  PlanetsCollectionViewController.swift
//  Planets
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit



class PlanetsCollectionViewController: UICollectionViewController {
    
    var planets: [Planet] {
        let shouldShowPluto = UserDefaults.standard.bool(forKey: .shouldShowPlutoKey)
         return shouldShowPluto ? planetController.planetsWithPluto : planetController.planetsWithoutPluto
    }
    
    let planetController = PlanetController()
    
    @IBAction func unwindToPlanetsCollectionViewController(_ sender: UIStoryboardSegue) {
        // This will unwind from the SettingsViewController back to here.
        // Dont need any code
        // Need to connect the action in storyboard
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return planets.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as! PlanetCollectionViewCell
        
        let planet = planets[indexPath.item]
        cell.imageView.image = planet.image
        cell.textLabel.text = planet.name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? PlanetDetailViewController else { return }
        
        detailVC.planetController = planetController
        
        // .first b/c there could be multiple items selected, .item b/c indexPath has section and item and you need just the item
        guard let index = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
        let planets = self.planets
        detailVC.planet = planets[index]
        
    }

}
