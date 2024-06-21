//
//  NewsViewModel.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation
import SwiftUI

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles: [Post] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var searchText: String = ""
    @Published var allArticles: [Post] = []
    @Published var firstTime: Bool = true
    
    private let repository: NewsRepositoryProtocol
    
    init(repository: NewsRepositoryProtocol = NewsRepository()) {
        self.repository = repository
    }
    
    func fetchNews() {
        isLoading = true
        Task {
            do {
                let articles = try await repository.fetchNews()
                self.articles = articles
                self.allArticles = articles
            } catch {
                self.errorMessage = error.localizedDescription
            }
            isLoading = false
        }
        firstTime = false
    }
    
    func filterArticlesBySearchText() {
        articles = allArticles
        if !searchText.isEmpty {
            articles = articles.filter { article in
                article.title.localizedCaseInsensitiveContains(searchText) || article.content.localizedCaseInsensitiveContains(searchText)
            }
        } else {
            articles = allArticles
        }
    }
}
