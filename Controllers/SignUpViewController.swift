//
//  SignUpViewController.swift
//  Nightline
//
//  Created by Odet Alexandre on 11/10/2016.
//  Copyright © 2016 Odet Alexandre. All rights reserved.
//

import Foundation
import SnapKit
import RealmSwift

class SignupViewController: UIViewController {
  
  let signupButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Sign Up"
    addBottomButton()
    initAllFields()
  }
  
  private func initAllFields() {
    let emailTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
    let nicknameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
    let passwordTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
    
    let stackViewSignUp = UIStackView()
    stackViewSignUp.axis = .vertical
    stackViewSignUp.spacing = AppConstant.UI.Dimensions.formElementsSpacing
    
    self.view.addSubview(stackViewSignUp)
    stackViewSignUp.snp.makeConstraints { (make) -> Void in
      make.center.equalTo(self.view)
    }
    stackViewSignUp.translatesAutoresizingMaskIntoConstraints = false
    
    emailTextField.backgroundColor = UIColor.black
    emailTextField.attributedPlaceholder = NSAttributedString(string:"E-mail",
                                                                 attributes:[NSForegroundColorAttributeName: Utils.UI.getAccentColor()])
    emailTextField.highlightBottom()
    emailTextField.textColor = Utils.UI.getAccentColor()
    emailTextField.textAlignment = .center
    
    nicknameTextField.backgroundColor = UIColor.black
    nicknameTextField.attributedPlaceholder = NSAttributedString(string:"Nickname",
                                                                 attributes:[NSForegroundColorAttributeName: Utils.UI.getAccentColor()])
    nicknameTextField.highlightBottom()
    nicknameTextField.textColor = Utils.UI.getAccentColor()
    nicknameTextField.textAlignment = .center
    
    passwordTextField.backgroundColor = UIColor.black
    passwordTextField.attributedPlaceholder = NSAttributedString(string:"Password",
                                                                 attributes:[NSForegroundColorAttributeName: Utils.UI.getAccentColor()])
    passwordTextField.highlightBottom()
    passwordTextField.textColor = Utils.UI.getAccentColor()
    passwordTextField.textAlignment = .center

    stackViewSignUp.addArrangedSubview(emailTextField)
    stackViewSignUp.addArrangedSubview(nicknameTextField)
    stackViewSignUp.addArrangedSubview(passwordTextField)
  }
  
  private func addBottomButton() {
    self.view.addSubview(signupButton)
    signupButton.snp.makeConstraints { (make) -> Void in
      make.bottom.equalTo(self.view)
      make.height.equalTo((self.navigationController?.navigationBar.frame.height)!)
      make.width.equalTo(self.view)
    }
    signupButton.translatesAutoresizingMaskIntoConstraints = false
    signupButton.backgroundColor = Utils.UI.getAccentColor()
    signupButton.setTitle("Sign up".uppercased(), for: .normal)
    signupButton.addTarget(self, action: #selector(showHomeScreen), for: .touchUpInside)
  }
  
  func showHomeScreen() {
    present(HomeViewController(), animated: true, completion: nil)
  }
}
