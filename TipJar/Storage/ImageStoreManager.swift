//
//  ImageManager.swift
//  TipJar
//
//  Created by Azhar Islam on 29/04/2022.
//

import UIKit

/// FileManager to save/retrieve images from user directory

class ImageStoreManager {
    
    static var imageName: String = Constants.App.emptyString
    
    static func applicationSupportURL() -> URL? {
        let fileManager = FileManager.default
        
        let urls = fileManager.urls(for: FileManager.SearchPathDirectory.applicationSupportDirectory, in: .userDomainMask)
        
        return urls.last
    }
    
    static func saveImage(_ imageName: String, image: UIImage, completion: @escaping (Error?) -> Void = { _ in }) {
        guard let documentsDirectory = self.applicationSupportURL() else {
            completion(NoApplicationSupportDirectoryAvailable())
            return
        }
        
        self.imageName = imageName
        
        let fileURL = documentsDirectory.appendingPathComponent(imageName)
        if let data = image.jpegData(compressionQuality:  1.0),
           !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try data.write(to: fileURL)
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    static func fetchImage(_ imageName: String) -> UIImage? {
        guard let documentsDirectory = self.applicationSupportURL() else {
            return nil
        }
        
        let imageURL = documentsDirectory.appendingPathComponent("\(imageName).png")
        let image = UIImage(contentsOfFile: imageURL.path)
        
        return image
    }
}

public struct NoApplicationSupportDirectoryAvailable: Error {}
