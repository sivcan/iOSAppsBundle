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
    
}

