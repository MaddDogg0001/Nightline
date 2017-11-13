//
//  Notifiable.swift
//  Nightline
//
//  Created by Odet Alexandre on 13/11/2017.
//  Copyright © 2017 Odet Alexandre. All rights reserved.
//

import Foundation

protocol Notifiable {
  func didReceiveNotification()
  func sendNotification()
}
