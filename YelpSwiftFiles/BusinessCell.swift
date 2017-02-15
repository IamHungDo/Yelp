//
//  BusinessCell.swift
//  Yelp
//
//  Created by Hung Do on 2/7/2017.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit



class BusinessCell: UITableViewCell {

    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var ratingView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbNail: UIImageView!
    
    var business: Business! {
        didSet {
            nameLabel.text = business.name
            if business.imageURL != nil {
            thumbNail.setImageWith((business.imageURL)!)
            } else {
            
            }
            foodTypeLabel.text = business.categories
            addressLabel.text = business.address
            reviewsLabel.text = "\(business.reviewCount!) Reviews"
            ratingView.setImageWith(business.ratingImageURL!)
            distanceLabel.text = business.distance
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbNail.layer.cornerRadius = 5
        thumbNail.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
