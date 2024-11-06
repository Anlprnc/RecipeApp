import SwiftUI
import UIKit

class ImagePickerService: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var isImagePickerPresented: Bool = false
    
    func pickImage() {
        isImagePickerPresented = true
    }
    
    func imagePickerDismissed() {
        isImagePickerPresented = false
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    @ObservedObject var imagePickerService: ImagePickerService
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.imagePickerService.selectedImage = image
            }
            parent.imagePickerService.imagePickerDismissed()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.imagePickerService.imagePickerDismissed()
        }
    }
}
