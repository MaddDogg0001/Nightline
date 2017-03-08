// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift

import Foundation
import Rswift
import UIKit

/// This `R` struct is code generated, and contains references to static resources.
struct R {
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 0 files.
  struct file {
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 12 images.
  struct image {
    /// Image `avatar`.
    static let avatar = ImageResource(bundle: _R.hostingBundle, name: "avatar")
    /// Image `back_arrow`.
    static let back_arrow = ImageResource(bundle: _R.hostingBundle, name: "back_arrow")
    /// Image `female`.
    static let female = ImageResource(bundle: _R.hostingBundle, name: "female")
    /// Image `interrogation`.
    static let interrogation = ImageResource(bundle: _R.hostingBundle, name: "interrogation")
    /// Image `logo`.
    static let logo = ImageResource(bundle: _R.hostingBundle, name: "logo")
    /// Image `male`.
    static let male = ImageResource(bundle: _R.hostingBundle, name: "male")
    /// Image `pin`.
    static let pin = ImageResource(bundle: _R.hostingBundle, name: "pin")
    /// Image `placeholder_filled`.
    static let placeholder_filled = ImageResource(bundle: _R.hostingBundle, name: "placeholder_filled")
    /// Image `placeholder`.
    static let placeholder = ImageResource(bundle: _R.hostingBundle, name: "placeholder")
    /// Image `settings_filled`.
    static let settings_filled = ImageResource(bundle: _R.hostingBundle, name: "settings_filled")
    /// Image `settings`.
    static let settings = ImageResource(bundle: _R.hostingBundle, name: "settings")
    /// Image `user`.
    static let user = ImageResource(bundle: _R.hostingBundle, name: "user")
    
    /// `UIImage(named: "avatar", bundle: ..., traitCollection: ...)`
    static func avatar(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.avatar, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "back_arrow", bundle: ..., traitCollection: ...)`
    static func back_arrow(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.back_arrow, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "female", bundle: ..., traitCollection: ...)`
    static func female(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.female, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "interrogation", bundle: ..., traitCollection: ...)`
    static func interrogation(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.interrogation, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.logo, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "male", bundle: ..., traitCollection: ...)`
    static func male(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.male, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "pin", bundle: ..., traitCollection: ...)`
    static func pin(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.pin, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "placeholder", bundle: ..., traitCollection: ...)`
    static func placeholder(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.placeholder, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "placeholder_filled", bundle: ..., traitCollection: ...)`
    static func placeholder_filled(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.placeholder_filled, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "settings", bundle: ..., traitCollection: ...)`
    static func settings(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.settings, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "settings_filled", bundle: ..., traitCollection: ...)`
    static func settings_filled(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.settings_filled, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "user", bundle: ..., traitCollection: ...)`
    static func user(compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.user, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIStoryboard {
      return UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 2 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 34 localization keys.
    struct localizable {
      /// fr translation: Bar
      /// 
      /// Locales: fr, en
      static let bar = StringResource(key: "bar", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Bar lounge
      /// 
      /// Locales: fr, en
      static let lounge = StringResource(key: "lounge", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Bière
      /// 
      /// Locales: fr, en
      static let beer = StringResource(key: "beer", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Boissons
      /// 
      /// Locales: fr, en
      static let drinks = StringResource(key: "drinks", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Boîte de nuit
      /// 
      /// Locales: fr, en
      static let club = StringResource(key: "club", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Bourbon
      /// 
      /// Locales: fr, en
      static let bourbon = StringResource(key: "bourbon", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Cancel
      /// 
      /// Locales: fr, en
      static let cancel = StringResource(key: "cancel", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Champagne
      /// 
      /// Locales: fr, en
      static let champagne = StringResource(key: "champagne", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Cocktails
      /// 
      /// Locales: fr, en
      static let cocktail = StringResource(key: "cocktail", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: E-mail
      /// 
      /// Locales: fr, en
      static let email = StringResource(key: "email", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Erreur
      /// 
      /// Locales: fr, en
      static let error = StringResource(key: "error", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Erreur au chargement des données
      /// 
      /// Locales: fr, en
      static let error_loading_data = StringResource(key: "error_loading_data", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Établissements
      /// 
      /// Locales: fr, en
      static let etabl = StringResource(key: "etabl", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: FAQ
      /// 
      /// Locales: fr, en
      static let faq = StringResource(key: "faq", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Femme
      /// 
      /// Locales: fr, en
      static let female = StringResource(key: "female", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Fratenité
      /// 
      /// Locales: fr, en
      static let brotherhood = StringResource(key: "brotherhood", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Groupe d'ami
      /// 
      /// Locales: fr, en
      static let friends = StringResource(key: "friends", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Homme
      /// 
      /// Locales: fr, en
      static let male = StringResource(key: "male", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Les informations entrées ne sont pas valides
      /// 
      /// Locales: fr, en
      static let connection_fail = StringResource(key: "connection_fail", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Mot de passe
      /// 
      /// Locales: fr, en
      static let password = StringResource(key: "password", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Mot de passe oublié ?
      /// 
      /// Locales: fr, en
      static let passwd_forgot = StringResource(key: "passwd_forgot", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Pseudo
      /// 
      /// Locales: fr, en
      static let nickname = StringResource(key: "nickname", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Pub irlandais
      /// 
      /// Locales: fr, en
      static let pub = StringResource(key: "pub", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Remerciements
      /// 
      /// Locales: fr, en
      static let thanks = StringResource(key: "thanks", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Réglages
      /// 
      /// Locales: fr, en
      static let settings = StringResource(key: "settings", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Rhum
      /// 
      /// Locales: fr, en
      static let rhum = StringResource(key: "rhum", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: S'enregistrer
      /// 
      /// Locales: fr, en
      static let sign_up = StringResource(key: "sign_up", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Se Connecter
      /// 
      /// Locales: fr, en
      static let sign_in = StringResource(key: "sign_in", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Se déconnecter
      /// 
      /// Locales: fr, en
      static let logout = StringResource(key: "logout", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Sisterhood
      /// 
      /// Locales: fr, en
      static let sisterhood = StringResource(key: "sisterhood", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Version
      /// 
      /// Locales: fr, en
      static let build = StringResource(key: "build", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Vin
      /// 
      /// Locales: fr, en
      static let wine = StringResource(key: "wine", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Vodka
      /// 
      /// Locales: fr, en
      static let vodka = StringResource(key: "vodka", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      /// fr translation: Whisky
      /// 
      /// Locales: fr, en
      static let whisky = StringResource(key: "whisky", tableName: "Localizable", bundle: _R.hostingBundle, locales: ["fr", "en"], comment: nil)
      
      /// fr translation: Bar
      /// 
      /// Locales: fr, en
      static func bar(_: Void = ()) -> String {
        return NSLocalizedString("bar", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Bar lounge
      /// 
      /// Locales: fr, en
      static func lounge(_: Void = ()) -> String {
        return NSLocalizedString("lounge", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Bière
      /// 
      /// Locales: fr, en
      static func beer(_: Void = ()) -> String {
        return NSLocalizedString("beer", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Boissons
      /// 
      /// Locales: fr, en
      static func drinks(_: Void = ()) -> String {
        return NSLocalizedString("drinks", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Boîte de nuit
      /// 
      /// Locales: fr, en
      static func club(_: Void = ()) -> String {
        return NSLocalizedString("club", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Bourbon
      /// 
      /// Locales: fr, en
      static func bourbon(_: Void = ()) -> String {
        return NSLocalizedString("bourbon", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Cancel
      /// 
      /// Locales: fr, en
      static func cancel(_: Void = ()) -> String {
        return NSLocalizedString("cancel", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Champagne
      /// 
      /// Locales: fr, en
      static func champagne(_: Void = ()) -> String {
        return NSLocalizedString("champagne", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Cocktails
      /// 
      /// Locales: fr, en
      static func cocktail(_: Void = ()) -> String {
        return NSLocalizedString("cocktail", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: E-mail
      /// 
      /// Locales: fr, en
      static func email(_: Void = ()) -> String {
        return NSLocalizedString("email", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Erreur
      /// 
      /// Locales: fr, en
      static func error(_: Void = ()) -> String {
        return NSLocalizedString("error", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Erreur au chargement des données
      /// 
      /// Locales: fr, en
      static func error_loading_data(_: Void = ()) -> String {
        return NSLocalizedString("error_loading_data", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Établissements
      /// 
      /// Locales: fr, en
      static func etabl(_: Void = ()) -> String {
        return NSLocalizedString("etabl", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: FAQ
      /// 
      /// Locales: fr, en
      static func faq(_: Void = ()) -> String {
        return NSLocalizedString("faq", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Femme
      /// 
      /// Locales: fr, en
      static func female(_: Void = ()) -> String {
        return NSLocalizedString("female", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Fratenité
      /// 
      /// Locales: fr, en
      static func brotherhood(_: Void = ()) -> String {
        return NSLocalizedString("brotherhood", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Groupe d'ami
      /// 
      /// Locales: fr, en
      static func friends(_: Void = ()) -> String {
        return NSLocalizedString("friends", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Homme
      /// 
      /// Locales: fr, en
      static func male(_: Void = ()) -> String {
        return NSLocalizedString("male", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Les informations entrées ne sont pas valides
      /// 
      /// Locales: fr, en
      static func connection_fail(_: Void = ()) -> String {
        return NSLocalizedString("connection_fail", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Mot de passe
      /// 
      /// Locales: fr, en
      static func password(_: Void = ()) -> String {
        return NSLocalizedString("password", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Mot de passe oublié ?
      /// 
      /// Locales: fr, en
      static func passwd_forgot(_: Void = ()) -> String {
        return NSLocalizedString("passwd_forgot", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Pseudo
      /// 
      /// Locales: fr, en
      static func nickname(_: Void = ()) -> String {
        return NSLocalizedString("nickname", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Pub irlandais
      /// 
      /// Locales: fr, en
      static func pub(_: Void = ()) -> String {
        return NSLocalizedString("pub", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Remerciements
      /// 
      /// Locales: fr, en
      static func thanks(_: Void = ()) -> String {
        return NSLocalizedString("thanks", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Réglages
      /// 
      /// Locales: fr, en
      static func settings(_: Void = ()) -> String {
        return NSLocalizedString("settings", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Rhum
      /// 
      /// Locales: fr, en
      static func rhum(_: Void = ()) -> String {
        return NSLocalizedString("rhum", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: S'enregistrer
      /// 
      /// Locales: fr, en
      static func sign_up(_: Void = ()) -> String {
        return NSLocalizedString("sign_up", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Se Connecter
      /// 
      /// Locales: fr, en
      static func sign_in(_: Void = ()) -> String {
        return NSLocalizedString("sign_in", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Se déconnecter
      /// 
      /// Locales: fr, en
      static func logout(_: Void = ()) -> String {
        return NSLocalizedString("logout", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Sisterhood
      /// 
      /// Locales: fr, en
      static func sisterhood(_: Void = ()) -> String {
        return NSLocalizedString("sisterhood", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Version
      /// 
      /// Locales: fr, en
      static func build(_: Void = ()) -> String {
        return NSLocalizedString("build", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Vin
      /// 
      /// Locales: fr, en
      static func wine(_: Void = ()) -> String {
        return NSLocalizedString("wine", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Vodka
      /// 
      /// Locales: fr, en
      static func vodka(_: Void = ()) -> String {
        return NSLocalizedString("vodka", bundle: _R.hostingBundle, comment: "")
      }
      
      /// fr translation: Whisky
      /// 
      /// Locales: fr, en
      static func whisky(_: Void = ()) -> String {
        return NSLocalizedString("whisky", bundle: _R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.main` struct is generated, and contains static references to 0 localization keys.
    struct main {
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}

struct _R {
  static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  static let hostingBundle = Bundle(identifier: "Nightline.AlexandreOdet") ?? Bundle.main
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard {
    struct main: StoryboardResourceWithInitialControllerType {
      typealias InitialController = MainViewController
      
      let bundle = _R.hostingBundle
      let name = "Main"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}