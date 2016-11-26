//
//  MainVC.swift
//  PartyRockMansion
//
//  Created by Sivcan Singh on 25/11/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var partyDrink  = [PartyDrinks]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        tableView.delegate = self
        tableView.dataSource = self
        
        //hardcoding the data.. (will use API's later)
        let p1 = PartyDrinks(imageURL: "https://3.bp.blogspot.com/-yNFoarmAu7Q/V8IOvZfTYrI/AAAAAAAAAQU/G8U6H41WXsItiP3ZdL8g4hW7me3VjIVmQCLcB/s1600/alan-walker-faded.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/60ItHLz5WEA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Alan Walker - Faded")
        partyDrink.append(p1)
        
        let p2 = PartyDrinks(imageURL: "https://s.mxmcdn.net/images-storage/albums/9/7/6/0/1/1/33110679_350_350.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Io0fBr1XBUA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "The Chainsmokers - Don't let me down")
        partyDrink.append(p2)
        
        let p3 = PartyDrinks(imageURL: "https://splice-res.cloudinary.com/image/upload/f_auto,q_auto,w_auto/t_medium/f_auto/q_80/t_medium/v1464982583/rcqsznhboxmxyarordzq.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ALZHF5UqnU4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Marshmello - Alone")
        partyDrink.append(p3)
        
        partyDrink.append(p2)
        partyDrink.append(p1)
        partyDrink.append(p3)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyDrink.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Drinker", for: indexPath) as? PartyCell {
            
            let partyRock = partyDrink[indexPath.row]
            
            cell.updateUI(partyDrinks: partyRock)
        
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyDrinks = partyDrink[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyDrinks)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyDrinks {
                destination.partyDrink = party
            }
        }
    }
    
}






