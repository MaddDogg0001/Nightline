//
//  CloudinaryManager.swift
//  Nightline
//
//  Created by cedric moreaux on 22/12/2017.
//  Copyright © 2017 Odet Alexandre. All rights reserved.
//

import Foundation
import Cloudinary
import Alamofire
import SwiftyJSON

class CloudinaryManager {
    let config: CLDConfiguration!
    let cloudinary: CLDCloudinary!
    static let shared = CloudinaryManager()

    init() {
        config = CLDConfiguration(cloudinaryUrl: "cloudinary://781695568757174:gasFxenV90DIsNUH__7ELxgvbnk@nightline")
        cloudinary = CLDCloudinary(configuration: config)
    }

    func uploadEstabImg(img: UIImage, estab_id: String, party_id: String = "0", callback: @escaping () -> ()) {
        self.uploadImg(img: img, folder: "establishment/\(estab_id)/\(party_id)/\(String(UserManager.instance.retrieveUserId()))", name: Date().toImgName) { callback() }
    }

    func uploadProfilePict(img: UIImage, user_id: String, callback: @escaping () -> ()) {
        self.deleteProfilePict(forUserId: user_id)
        self.uploadImg(img: img, folder: "profilePictures", name: user_id) { callback() }
    }

    func uploadImg(img: UIImage, folder: String, name: String, callback: @escaping () -> ()) {
        if let data = UIImageJPEGRepresentation(img, 0.3) {
            var params = CLDUploadRequestParams()
            params = params.setFolder(folder)
            params.setPublicId(name)
            cloudinary.createUploader().upload(data: data, uploadPreset: "cdnNightline", params: params, completionHandler: { (result, error) in
                if let error = error {
                    log.error("Upload finished with failure, error: \(error)")
                } else {
                    log.verbose("Upload finished with success, image's url: \(String(describing: result?.url))")
                    callback()
                }
            })
        }
    }

    func getAllImagesUrlFromUser(callback: @escaping ([String]) -> Void) {
        getFolderImgUrls(folder: "establishment/") { (list) in
            var urlArray = [String]()
            let id = String(UserManager.instance.retrieveUserId())
            list.forEach({ (url) in
                let splited = url.split(separator: "/")
                if splited[splited.count - 2] == id {
                    urlArray.append(url)
                }
            })
            callback(urlArray)
        }
    }

    func getFolderImgUrls(folder: String, callback: @escaping ([String]) -> ()) {
        guard let url = URL(string:"https://781695568757174:gasFxenV90DIsNUH__7ELxgvbnk@api.cloudinary.com/v1_1/nightline/resources/image/upload/?prefix=" + folder) else { return }
        var urls = [String]()
        Alamofire.request(url, method: .get, parameters: nil)
        .validate()
        .responseJSON { (response) in
            if let data = response.data {
                do {
                    if let json = try JSON(data: data)["resources"].array {
                        for elem in json {
                            urls.append(String(describing: elem["secure_url"]))
                        }
                    }
                } catch {
                    log.error("getFolderImgUrls - Error parsing json")
                }
            }
            callback(urls)
        }
    }

    func downloadProfilePicture(withUserId userId: String, callback: @escaping (UIImage?) -> ()) {
        let url = cloudinary.createUrl().generate("profilePictures/\(userId)")
        if let url = url {
            downloadImg(withUrl: url) { (image) in
                callback(image)
            }
        }
    }

    func downloadImg(withUrl url: String, callback: @escaping (UIImage?) -> ()) {
        cloudinary.createDownloader().fetchImage(url, nil) { (img, error) in
            if let image = img {
                callback(image)
            } else {
                log.error("downloadImg - error downloading img")
                log.error("url => \(url)")
                log.error("error => \(String(describing: error?.code)) - \(String(describing: error?.debugDescription))")
                callback(nil)
            }
        }
    }

    func deleteProfilePict(forUserId id: String) {
        cloudinary.createManagementApi().destroy("profilePictures/\(id)")
    }
}

extension Date {
    var toImgName: String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd-HH:mm:ss"
        return df.string(from: self)
    }
}
