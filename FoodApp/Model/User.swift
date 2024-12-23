//
//  User.swift
//  FoodApp
//
//  Created by Anıl on 2.11.2024.
//

import Foundation

enum UserRole: String, Codable {
    case USER = "user"
    case MANAGER = "manager"
    case ADMIN = "admin"
}

struct User: Codable {
    let id: String
    let email: String
    let fullName: String
    var avatarUrl: String?
    var favorites: [String]?
    let role: UserRole
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
    let fullName: String
    let email: String
    let password: String
}

struct AvatarResponse: Codable {
    let avatarUrl: String
}
