//
//  UsersViewModel.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation
import SwiftUI

@MainActor
class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let repository: UsersRepositoryProtocol
    
    init(repository: UsersRepositoryProtocol = UsersRepository()) {
        self.repository = repository
    }
    
    func fetchUsers() {
        isLoading = true
        Task {
            do {
                let users = try await repository.fetchUsers()
                self.users = users
            } catch {
                self.errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
