//
//  AlertUtils.swift
//  Nightline
//
//  Created by Odet Alexandre on 16/02/2017.
//  Copyright © 2017 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class AlertUtils {
  
  static func networkErrorAlert(fromController: UIViewController) {
    let alert = UIAlertController(title: "Erreur",
                                  message: "Une erreur est survenue au chargement des données !",
                                  preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "Annuler", style: .destructive, handler: nil))
    fromController.present(alert, animated: true, completion: nil)
  }
  
  static func noConnectivityAlert(fromController: UIViewController) {
    let alert = UIAlertController(title: "Erreur", message: "Une connexion internet est nécessaire pour profiter pleinement de Nightline", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "Annuler", style: .destructive, handler: nil))
    fromController.present(alert, animated: true, completion: nil)
  }
  
}