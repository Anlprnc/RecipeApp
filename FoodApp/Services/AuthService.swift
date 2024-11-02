//
//  AuthService.swift
//  FoodApp
//
//  Created by Anıl on 2.11.2024.
//

import Foundation
import UIKit

class AuthService: ObservableObject {
    private let baseURL = "http://localhost:3000/api"
    
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    @Published var error: String?
    
    func login(email: String, password: String) async {
        do {
            guard let url = URL(string: "\(baseURL)/auth/login") else { return }
            
            let loginRequest = LoginRequest(email: email, password: password)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(loginRequest)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(AuthResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.currentUser = response.user
                self.isAuthenticated = true
                UserDefaults.standard.set(response.token, forKey: "authToken")
            }
        } catch {
            DispatchQueue.main.async {
                self.error = error.localizedDescription
            }
        }
    }
    
    func register(fullName: String, email: String, password: String) async {
        do {
            guard let url = URL(string: "\(baseURL)/auth/register") else { return }
            
            let registerRequest = RegisterRequest(fullName: fullName, email: email, password: password)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(registerRequest)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(AuthResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.currentUser = response.user
                self.isAuthenticated = true
                UserDefaults.standard.set(response.token, forKey: "authToken")
            }
        } catch {
            DispatchQueue.main.async {
                self.error = error.localizedDescription
            }
        }
    }
    
    func logout() {
        currentUser = nil
        isAuthenticated = false
        UserDefaults.standard.removeObject(forKey: "authToken")
    }
    
    func uploadAvatar(_ image: UIImage) async {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        guard let token = UserDefaults.standard.string(forKey: "authToken") else { return }
        
        do {
            let boundary = UUID().uuidString
            guard let url = URL(string: "\(baseURL)/users/avatar") else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            var data = Data()
            data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
            data.append("Content-Disposition: form-data; name=\"avatar\"; filename=\"avatar.jpg\"\r\n".data(using: .utf8)!)
            data.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
            data.append(imageData)
            data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
            
            request.httpBody = data
            
            let (responseData, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(AvatarResponse.self, from: responseData)
            
            DispatchQueue.main.async {
                self.currentUser?.avatarUrl = response.avatarUrl
            }
        } catch {
            DispatchQueue.main.async {
                self.error = error.localizedDescription
            }
        }
    }
    
    func updateProfile(fullName: String, email: String) async {
        guard let token = UserDefaults.standard.string(forKey: "authToken") else { return }
        
        do {
            guard let url = URL(string: "\(baseURL)/users/profile") else { return }
            
            struct UpdateProfileRequest: Codable {
                let fullName: String
                let email: String
            }
            
            let updateRequest = UpdateProfileRequest(
                fullName: fullName,
                email: email
            )
            
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpBody = try JSONEncoder().encode(updateRequest)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let updatedUser = try JSONDecoder().decode(User.self, from: data)
            
            DispatchQueue.main.async {
                self.currentUser = updatedUser
                self.error = nil
            }
        } catch {
            DispatchQueue.main.async {
                self.error = error.localizedDescription
            }
        }
    }
}
