//
//  CountryListController.swift
//  Fellowcountries
//
//  Created by Chakane Shegog on 5/18/21.
//

import UIKit

class CountryListController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var continents = [[Country]]() {
        didSet { // property observer to reload the table view
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set the VC as the datasource for the table view
        tableView.dataSource = self
        
        // get access to the continents array of arrays in the Country.swift file
        
        // we have instance methods and we have type methods
        // instance methods are called explicitly on the instance
        continents = Country.getContinents() // gertContinets is a type method
    }
}

extension CountryListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // since we have sections in our data we need to return the sections count
        // each section (or continent) knows how many countries it has. e.g Africa, for now, has one country
        return continents[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell else {
            // explicitly crashes the app at runtime if a CountryCell does not exist,
            // this is a developer error
            fatalError("Couldent dequeue a countryCell")
        }
        
        // get the object (country) to be set at the current indexPath
        // we use an array of arrays to get the current country
        let country = continents[indexPath.section][indexPath.row]
        cell.configureCell(for: country)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        continents.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return continents[section].first?.continent
    }

}
