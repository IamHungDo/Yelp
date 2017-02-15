//
//  BusinessDetailViewController.swift
//  Yelp
//
//  Created by Hung Do on 2/10/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class BusinessDetailViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var reviewView: UIView!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var ratingsView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var businesses: Business!
    var locationManager : CLLocationManager!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reviewView.layer.borderWidth = 0.2
        reviewView.layer.cornerRadius = 5;
        reviewView.layer.masksToBounds = true


        let title = businesses.name as String!
        titleLabel.text = title
        
        let distance = businesses.distance as String!
        distanceLabel.text = distance
        
        let ratings = businesses.ratingImageURL
        ratingsView.setImageWith(ratings!)
        
        let foodType = businesses.categories
        foodTypeLabel.text = foodType
        
        if businesses.imageURL != nil {
        let picture = businesses.imageURL
        posterView.setImageWith(picture!)
        } else {
            
        }
        
        let reviews = businesses.reviewCount
        reviewsLabel.text = "\(reviews!) Reviews"

    //Mapview
        let centerLocation = CLLocation(latitude: 37.7833, longitude: -122.4167)
        goToLocation(location: centerLocation)
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 200
        locationManager.requestWhenInUseAuthorization()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(location.coordinate, span)
            mapView.setRegion(region, animated: false)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
