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
import Rswift

/*
 Controllers: SignupViewController.
 This controller is displayed when user tries to register into the app.
 */

final class SignupViewController: BaseViewController, UITextFieldDelegate {
  
  let restApiUser = RAUser()
  let signupButton = UIButton()
  let emailTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
  let nicknameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
  let passwordTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
  let backButton = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

  deinit {
    restApiUser.cancelRequest()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.hideKeyboardWhenTappedAround()
    self.title = R.string.localizable.sign_up()
    let backgroundImage = UIImageView(image: R.image.background())
    self.view.addSubview(backgroundImage)
    backgroundImage.snp.makeConstraints { (make) -> Void in
      make.edges.equalTo(self.view)
    }
    backgroundImage.alpha = 0.5
    if Utils.Network.isInternetAvailable() == false {
      self.showNoConnectivityView()
    } else {
      addBottomButton()
      initAllFields()
      addBackButton()
    }
  }
  
  /*
   initAllFields() func.
   This func sets position and content of the UIStackView used into the view.
   @param None
   @return None
   */
  
  private func initAllFields() {
    
    let stackViewSignUp = UIStackView()
    stackViewSignUp.axis = .vertical
    stackViewSignUp.spacing = AppConstant.UI.Dimensions.formElementsSpacing
    
    self.view.addSubview(stackViewSignUp)
    stackViewSignUp.snp.makeConstraints { (make) -> Void in
      make.center.equalTo(self.view)
      make.leading.equalTo(self.view).offset(30)
      make.trailing.equalTo(self.view).offset(-30)
    }
    stackViewSignUp.translatesAutoresizingMaskIntoConstraints = false
    
    emailTextField.backgroundColor = UIColor.black
    emailTextField.attributedPlaceholder = NSAttributedString(string: R.string.localizable.email(),
                                                              attributes:[NSForegroundColorAttributeName: self.getAccentColor()])
    emailTextField.highlightBottom()
    emailTextField.textColor = self.getAccentColor()
    emailTextField.textAlignment = .center
    emailTextField.delegate = self
    emailTextField.keyboardType = .emailAddress
    emailTextField.returnKeyType = .next
    emailTextField.tag = 0
    emailTextField.becomeFirstResponder()
    emailTextField.backgroundColor = .clear
    
    nicknameTextField.backgroundColor = UIColor.black
    nicknameTextField.attributedPlaceholder = NSAttributedString(string:R.string.localizable.nickname(),
                                                                 attributes:[NSForegroundColorAttributeName: self.getAccentColor()])
    nicknameTextField.highlightBottom()
    nicknameTextField.textColor = self.getAccentColor()
    nicknameTextField.textAlignment = .center
    nicknameTextField.delegate = self
    nicknameTextField.returnKeyType = .next
    nicknameTextField.tag = 1
    nicknameTextField.backgroundColor = .clear
    
    passwordTextField.backgroundColor = UIColor.black
    passwordTextField.attributedPlaceholder = NSAttributedString(string:R.string.localizable.password(),
                                                                 attributes:[NSForegroundColorAttributeName: self.getAccentColor()])
    passwordTextField.highlightBottom()
    passwordTextField.textColor = self.getAccentColor()
    passwordTextField.textAlignment = .center
    passwordTextField.isSecureTextEntry = true
    passwordTextField.returnKeyType = .done
    passwordTextField.tag = 2
    passwordTextField.delegate = self
    passwordTextField.backgroundColor = .clear
    
    stackViewSignUp.addArrangedSubview(emailTextField)
    stackViewSignUp.addArrangedSubview(nicknameTextField)
    stackViewSignUp.addArrangedSubview(passwordTextField)
  }
  
  /*
   addBottomButton() func.
   This functions sets position and content of the signupButton into self.view
   @param None
   @return None
   */
  
  private func addBottomButton() {
    self.view.addSubview(signupButton)
    signupButton.snp.makeConstraints { (make) -> Void in
      make.bottom.equalTo(self.view)
      make.height.equalTo(50)
      make.width.equalTo(self.view)
    }
    signupButton.translatesAutoresizingMaskIntoConstraints = false
    signupButton.backgroundColor = self.getAccentColor()
    signupButton.setTitle(R.string.localizable.sign_up().uppercased(), for: .normal)
    signupButton.addTarget(self, action: #selector(showHomeScreen), for: .touchUpInside)
  }
  
  /*
   showHomeScreen() func.
   This function is called when user clicks on the signupButton.
   If user filled all the fields that'll register the user in the app, and save the token received by server into keychain service.
   @param None
   @return None
   */
  
  func showHomeScreen() {
    restApiUser.signUpUser(email: emailTextField.text!, nickname: nicknameTextField.text!, password: passwordTextField.text!, callback: { user in
      Utils.Network.spinnerStop()
      TokenWrapper().setToken(valueFor: user.token)
      DatabaseHandler().insertInDatabase(object: DbUser.self, properties: ["email":self.emailTextField.text!,
                                                                           "passwd":self.passwordTextField.text!,
                                                                           "nickname":self.nicknameTextField.text!])
      self.dismiss(animated: true, completion: { self.presentingViewController?.dismiss(animated: false, completion: nil)})
    }, callbackError: {
      Utils.Network.spinnerStop()
      AlertUtils.networkErrorAlert(fromController: self)
    })
//    if !((emailTextField.text?.isEmpty)!) && !(passwordTextField.text?.isEmpty)! && !(nicknameTextField.text?.isEmpty)! {
//      Utils.Network.spinnerStart()
//    }
//    else {
//      log.error("Sign up fail")
//      let alert = UIAlertController(title: R.string.localizable.error(), message: R.string.localizable.connection_fail(), preferredStyle: UIAlertControllerStyle.alert)
//      alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//      self.present(alert, animated: true, completion: nil)
//    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //
    if textField.tag != 2 {
      textField.resignFirstResponder()
      let newTextField = self.view.viewWithTag(textField.tag + 1)
      newTextField?.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
      self.view.endEditing(true)
    }
    return true
  }
  
   /*
   addBackButton() func.
   This function sets position and content of backButton into self.view
   @param None
   @return None
   */
  
  private func addBackButton() {
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backButtonPressed))
    gestureRecognizer.numberOfTapsRequired = 1
    self.view.addSubview(backButton)
    backButton.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(self.view).offset(UIApplication.shared.statusBarFrame.height)
      make.leading.equalTo(self.view).offset(10)
      make.size.equalTo(50)
    }
    backButton.isUserInteractionEnabled = true
    backButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.image = R.image.back_arrow()
    backButton.backgroundColor = UIColor.white
    backButton.roundImage(withBorder: true, borderColor: .red, borderSize: 1.0)
    backButton.addGestureRecognizer(gestureRecognizer)
  }
  
  /*
   backButtonPressed() func.
   This function is called when user clicks on backButton.
   That dismisses this controller.
   @param None
   @return None
   */
  
  func backButtonPressed() {
    self.dismiss(animated: true, completion: nil)
  }
  
}
