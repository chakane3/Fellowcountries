//
//  CountryCell.swift
//  Fellowcountries
//
//  Created by Chakane Shegog on 5/19/21.
//



import UIKit

class CountryCell: UITableViewCell {
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryDescriptionLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // make the country image view circular
        // we use half of the diameter to get the radius of the circle
        // e.g if the diameter is 100, the radius is 50
        
        // at the bottom of a UIView is a CSLayer
        countryImageView.layer.cornerRadius = countryImageView.frame.size.width / 2
    }
    
    func configureCell(for country: Country) {
        countryImageView.image = UIImage(named: country.thumbnailImageName)
        countryNameLabel.text = country.name
        countryDescriptionLabel.text = country.countryDescription
    }
    
}
