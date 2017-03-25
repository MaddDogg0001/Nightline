//
//  ProfileViewController.swift
//  Nightline
//
//  Created by Odet Alexandre on 24/03/2017.
//  Copyright © 2017 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ProfileViewController: BaseViewController {
  
  var isUser = false
  var imgHeader = UIImageView()
  var imgProfile = UIImageView(frame: CGRect(x: 0, y: 0,
                                             width: AppConstant.UI.Dimensions.thumbnailPictureSize,
                                             height: AppConstant.UI.Dimensions.thumbnailPictureSize))
  
  private var separatorView = UIView()
  private var infoContainerView = UIView()
  var nameLabel = UILabel()
  var typeLabel = UILabel()
  var nicknameLabel = UILabel()
  private var birthdayImage = UIImageView()
  var birthdayLabel = UILabel()
  var likeButton = UIImageView()
  private var locationImage = UIImageView()
  var locationLabel = UILabel()
  var descriptionLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.white
    self.addHeader()
    addProfilePicture()
    addInfoContainerView()
    fillInfoContainerView()
  }
  
  private func addHeader() {
    if isUser {
      imgHeader.image = R.image.party()
    }
    self.view.addSubview(imgHeader)
    imgHeader.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(self.view)
      make.width.equalTo(self.view)
      make.height.equalTo(250)
    }
    imgHeader.translatesAutoresizingMaskIntoConstraints = false
    imgHeader.isUserInteractionEnabled = false
  }
  
  private func addProfilePicture() {
    imgProfile.roundImage(withBorder: true, borderColor: UIColor.black, borderSize: 1.0)
    self.view.addSubview(imgProfile)
    imgProfile.snp.makeConstraints { (make) -> Void in
      make.centerX.equalTo(self.view)
      make.centerY.equalTo(imgHeader.snp.bottom)
      make.size.equalTo(AppConstant.UI.Dimensions.thumbnailPictureSize)
    }
    imgProfile.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func addInfoContainerView() {
    self.view.addSubview(infoContainerView)
    infoContainerView.backgroundColor = UIColor.clear
    infoContainerView.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(imgHeader.snp.bottom)
      make.width.equalTo(self.view)
      make.height.equalTo(150)
    }
    infoContainerView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(separatorView)
    separatorView.backgroundColor = UIColor.lightGray
    separatorView.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(infoContainerView.snp.bottom)
      make.height.equalTo(1)
      make.width.equalTo(self.view)
    }
    separatorView.translatesAutoresizingMaskIntoConstraints = false
    separatorView.isUserInteractionEnabled = false
  }
  
  private func fillInfoContainerView() {
    self.view.addSubview(nameLabel)
    nameLabel.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(infoContainerView).offset(30)
      make.leading.equalTo(infoContainerView).offset(10)
      make.trailing.equalTo(infoContainerView.snp.centerX).offset(-3)
    }
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
    nameLabel.textColor = .darkGray
    
    if isUser {
      self.view.addSubview(nicknameLabel)
      nicknameLabel.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(nameLabel)
        make.trailing.equalTo(infoContainerView).offset(-10)
        make.leading.lessThanOrEqualTo(infoContainerView.snp.centerX).offset(3)
      }
      nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
      
      self.view.addSubview(birthdayImage)
      birthdayImage.image = R.image.birthday()
      birthdayImage.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(nameLabel.snp.bottom).offset(3)
        make.leading.equalTo(nameLabel)
        make.size.equalTo(30)
      }
      birthdayImage.isUserInteractionEnabled = false
      birthdayImage.translatesAutoresizingMaskIntoConstraints = false
      
      self.view.addSubview(birthdayLabel)
      birthdayLabel.snp.makeConstraints { (make) -> Void in
        make.centerY.equalTo(birthdayImage)
        make.leading.equalTo(birthdayImage.snp.trailing)
      }
      birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
    } else {
      self.view.addSubview(likeButton)
      likeButton.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(nameLabel)
        make.trailing.equalTo(infoContainerView).offset(-10)
        make.size.equalTo(25)
      }
      likeButton.translatesAutoresizingMaskIntoConstraints = false
      self.view.addSubview(typeLabel)
      typeLabel.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(nameLabel.snp.bottom).offset(20)
        make.leading.equalTo(nameLabel)
        make.trailing.equalTo(nameLabel)
      }
      typeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    addLocation()
    addDescription()
  }
  
  private func addLocation() {
    self.view.addSubview(locationLabel)
    if isUser {
      locationLabel.snp.makeConstraints { (make) -> Void in
        make.trailing.equalTo(nicknameLabel)
        make.centerY.equalTo(birthdayLabel)
      }
      locationLabel.translatesAutoresizingMaskIntoConstraints = false
    } else {
      locationLabel.snp.makeConstraints { (make) -> Void in
        make.trailing.equalTo(likeButton)
        make.centerY.equalTo(typeLabel)
      }
      locationLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    self.view.addSubview(locationImage)
    locationImage.image = R.image.location()
    locationImage.snp.makeConstraints { (make) -> Void in
      make.centerY.equalTo(locationLabel)
      make.size.equalTo(20)
      make.trailing.equalTo(locationLabel.snp.leading).offset(-3)
    }
    locationImage.translatesAutoresizingMaskIntoConstraints = false
    locationImage.isUserInteractionEnabled = false
  }
  
  private func addDescription() {
    self.view.addSubview(descriptionLabel)
    descriptionLabel.snp.makeConstraints { (make) -> Void in
      make.bottom.equalTo(infoContainerView).offset(-3)
      make.leading.equalTo(nameLabel)
      make.trailing.equalTo(locationLabel)
    }
    descriptionLabel.numberOfLines = 2
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.textAlignment = .center
    descriptionLabel.font = descriptionLabel.font.withSize(descriptionLabel.font.pointSize - 2)
  }
}