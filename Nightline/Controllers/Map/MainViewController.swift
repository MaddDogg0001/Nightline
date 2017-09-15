//
//  MainViewController.swift
//  Nightline
//
//  Created by Odet Alexandre on 21/10/2016.
//  Copyright © 2016 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import MapKit
import PromiseKit

/*
 Controllers: MainViewController
 This controller is the main one, when user launches the app it starts here.
 Containing the Map with all the pins around user location.
 */

final class MainViewController: BaseViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    static let notificationIdentifier = "presentConnexionScreen"

    var map = MKMapView()
    let locationManager = CLLocationManager()
    var restApiUser = RAUser()
    var restApiEtablishment = RAEtablissement()
    let searchButton = UIButton()



    deinit {
        restApiUser.cancelRequest()
        restApiEtablishment.cancelRequest()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        AchievementManager.instance.initUserAchievementArray()
        if (tokenWrapper.getToken() == nil) {
            self.present(HomeViewController(), animated: true, completion: nil)
        } else {
            requestLocationAccess()
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                //locationManager.startUpdatingLocation()
            }
            if Utils.Network.isInternetAvailable() == false {
                self.showNoConnectivityView()
            } else {
                self.view.addSubview(map)
                map.snp.makeConstraints { (make) -> Void in
                    make.edges.equalTo(self.view)
                }
                map.showsUserLocation = true
                map.isZoomEnabled = true
                map.delegate = self
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(callbackObserver), name: NSNotification.Name(rawValue: MainViewController.notificationIdentifier), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(connexionOK), name: NSNotification.Name(rawValue: SigninViewController.notificationIdentifier), object: nil)
        setUpSearchButton()
    }

    func setUpSearchButton() {
        searchButton.setImage(UIImage(named: "search_icon"), for: .normal)
        searchButton.imageView?.contentMode = .scaleAspectFill

        let butBG = UIView()
        butBG.backgroundColor = UIColor.lightGray.alpha(0.5)
        butBG.layer.cornerRadius = 4

        map.addSubview(butBG)
        map.addSubview(searchButton)

        searchButton.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.bottom.equalToSuperview().offset(0 - (self.navigationController?.navigationBar.frame.size.height ?? 0) - 20)
            make.right.equalToSuperview().offset(-20)
        }

        butBG.snp.makeConstraints { make in
            make.center.equalTo(searchButton)
            make.size.equalTo(searchButton).offset(10)
        }

        let searchGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(popSearchView))
        searchButton.addGestureRecognizer(searchGestureRecognizer)
    }

    func popSearchView() {
        let nextVC = SearchUserViewController()
        tabBarController?.navigationController?.pushViewController(nextVC, animated: true)
    }

    /*
     requestLocationAccess() function
     This function asks user's permission to access his location when he uses the app.
     @param None
     @return None
     */

    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()

        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return

        case .denied, .restricted:
            print("location access denied")

        default:
            self.locationManager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        // Enlevé pour centrer la carte pour la beta
        //    let location = locations.last! as CLLocation

        //    let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let center = CLLocationCoordinate2D(latitude: 48.8517, longitude: 2.3477)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

        self.map.setRegion(region, animated: true)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        if let annotation = annotation as? Marker {
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if pinView == nil {
                pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                pinView!.canShowCallout = true
                pinView?.image = R.image.pin()
                pinView?.tag = 1
            }
            else {
                pinView?.annotation = annotation
            }
            return pinView
        }
        return nil
    }

    func didTapCalloutButton(sender: UITapGestureRecognizer) {
        guard let annotation = (sender.view as? MKAnnotationView)?.annotation as? Marker else { return }

        let actionList = UIAlertController(title: annotation.name, message: "", preferredStyle: .actionSheet)
        actionList.addAction(UIAlertAction(title: "Accéder à la fiche du bar", style: .default, handler: { action in
            let nextViewController = EtablishmentViewController()
            nextViewController.idBar = annotation.id
            self.tabBarController?.navigationController?.pushViewController(nextViewController, animated: true)
        }))
        actionList.addAction(UIAlertAction(title: "Annuler", style: .destructive, handler: nil))
        self.present(actionList, animated: true, completion: nil)
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard view.tag == 1 else {
            return
        }
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapCalloutButton(sender:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstly {
            restApiEtablishment.getEtablishmentList()
            }.then { [weak self] response -> Void in
              guard let strongSelf = self else { return }
                if let tab = response.array {
                    for item in tab {
                        let coordinates = CLLocationCoordinate2DMake(CLLocationDegrees(item.latitude),
                                                                     CLLocationDegrees(item.longitude)) // ou (item.long, item.lat)
                        let marker = Marker(title: item.name,
                                            locationName: item.name,
                                            discipline: "",
                                            coordinate: coordinates, id: item.id)
                        strongSelf.map.addAnnotation(marker)
                    }
                } else {
                    print("=== Error, the array of establishments is empty ===")
                }
            }.catch { error in
                print("Error = ", error.localizedDescription)
        }
        let coordinates = CLLocationCoordinate2DMake(CLLocationDegrees(48.5271),
                                                     CLLocationDegrees(0.3036)) // ou (item.long, item.lat)
        let marker = Marker(title: "ced's bar",
                            locationName: "In the cambrousse",
                            discipline: "",
                            coordinate: coordinates, id: 404)
        self.map.addAnnotation(marker)
    }

    /*
     callbackObserver() func
     This function is called when the observer subscribed in the viewDidLoad() method is called.
     It will present the HomeViewController().
     @param None
     @return None
     */

    func callbackObserver() {
        self.present(HomeViewController(), animated: true, completion: nil)
    }

    func connexionOK() {
        self.presentedViewController?.dismiss(animated: true, completion: nil)
    }
}
