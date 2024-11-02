//
//  ProfileView.swift
//  FoodApp
//
//  Created by Anıl on 2.11.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authService: AuthService
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Form {
                    Section {
                        HStack(alignment: .top) {
                            Spacer()
                            VStack {
                                if let avatarUrl = authService.currentUser?.avatarUrl,
                                   let url = URL(string: "http://localhost:3000\(avatarUrl)") {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                } else {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.gray)
                                }
                                
                                Button("Change Photo") {
                                    showImagePicker = true
                                }
                                .font(.caption)
                                .padding(.top, 3)
                                
                                if let user = authService.currentUser {
                                    Text(user.fullName)
                                        .padding(.top, 3)
                                }
                            }
                            Spacer()
                        }
                    }
                    
                    Section(header: Text("Account Information")) {
                        if let user = authService.currentUser {
                            HStack {
                                Text("Email")
                                Spacer()
                                Text(user.email)
                                    .foregroundColor(.gray)
                            }
                            
                            HStack {
                                Text("Member Since")
                                Spacer()
                                Text(formatDate(user.createdAt))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    Section {
                        Button("Logout") {
                            authService.logout()
                        }
                        .foregroundColor(.red)
                    }
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
            .onChange(of: selectedImage) { newImage in
                if let image = newImage {
                    Task {
                        await authService.uploadAvatar(image)
                    }
                }
            }
            .alert("Error", isPresented: .constant(authService.error != nil)) {
                Button("OK") {
                    authService.error = nil
                }
            } message: {
                Text(authService.error ?? "")
            }
        }
        
        Spacer()
    }
    
    private func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
        return dateString
    }
    
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
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
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    ProfileView()
}
