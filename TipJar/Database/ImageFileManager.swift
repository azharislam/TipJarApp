//
//  ImageManager.swift
//  TipJar
//
//  Created by Azhar Islam on 29/04/2022.
//

import UIKit

public struct NoApplicationSupportDirectoryAvailable: Error {}

class ImageFileManager {

    static var fileName: String = ""

    static func applicationSupportURL() -> URL? {
        let fileManager = FileManager.default

        let urls = fileManager.urls(for: FileManager.SearchPathDirectory.applicationSupportDirectory, in: .userDomainMask)
        
        return urls.last
    }
    
    static func saveImage(_ fileName: String, image: UIImage, completion: @escaping (Error?) -> Void = { _ in }) {
        guard let documentsDirectory = self.applicationSupportURL() else {
            completion(NoApplicationSupportDirectoryAvailable())
            return
        }

        self.fileName = fileName

        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        if let data = image.jpegData(compressionQuality:  1.0),
          !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                // writes the image data to disk
                try data.write(to: fileURL)
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    static func getImage(_ fileName: String) -> UIImage? {
        guard let documentsDirectory = self.applicationSupportURL() else {
            return nil
        }
        
        let imageURL = documentsDirectory.appendingPathComponent("\(fileName).png")
        let image = UIImage(contentsOfFile: imageURL.path)
       
        return image
    }
}

