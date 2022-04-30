//
//  CustomCameraView.swift
//  TipJar
//
//  Created by Azhar Islam on 29/04/2022.
//

import UIKit
import SwiftUI

/// Use camera from UIImagePicker in SwiftUI

struct CameraComponent: UIViewControllerRepresentable {
    
    @Binding var isShowing: Bool
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isEnabled: $isShowing, camera: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding private var isEnabled: Bool
        var camera: CameraComponent
        
        init(isEnabled: Binding<Bool>, camera: CameraComponent) {
            self._isEnabled = isEnabled
            self.camera = camera
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            defer {
                self.isEnabled = false
            }
            
            guard let selectedImage = info[.originalImage] as? UIImage else { return }
            self.camera.selectedImage = selectedImage
        }
    }
}
