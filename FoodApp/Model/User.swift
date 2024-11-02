//
//  User.swift
//  FoodApp
//
//  Created by Anıl on 2.11.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let firstName: String?
    let lastName: String?
    var avatarUrl: String?
    let createdAt: String
    let updatedAt: String
}

struct AuthResponse: Codable {
    let user: User
    let token: String
}

struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct RegisterRequest: Codable {
    let email: String
    let password: String
}

struct AvatarResponse: Codable {
    let avatarUrl: String
}
