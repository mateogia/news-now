//
//  NewsView.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation
import SwiftUI

struct NewsView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                VStack {
                    Text("NewsNow")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.vertical, 20)
                        .foregroundStyle(.blue)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 2)
                        
                        TextField("Search for a post", text: $viewModel.searchText)
                            .onSubmit() {
                                viewModel.filterArticlesBySearchText()
                            }
                            .disableAutocorrection(true)
                            .padding(.horizontal, 10)
                    }
                    .frame(height: 44)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 50)
                    
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else if let errorMessage = viewModel.errorMessage {
                        Text("Error: \(errorMessage)")
                    } else {
                        
                        VStack {
                            Text("Showing \(viewModel.articles.count) posts")
                                .font(.footnote)
                                .foregroundStyle(.blue)
                            List(viewModel.articles) { article in
                                NavigationLink(destination: NewsDetailView(post: article)) {
                                    VStack(alignment: .leading) {
                                        Text(article.title)
                                            .font(.headline)
                                        Text(article.publishedAt)
                                            .font(.footnote)
                                    }
                                }
                            }
                            .onChange(of: viewModel.searchText) { _ in
                                viewModel.filterArticlesBySearchText()
                            }
                            .listStyle(.plain)
                            .padding(.horizontal, 15)
                            .foregroundStyle(.black, .blue)
                        }
                    }
                }
                .onAppear {
                    if viewModel.firstTime {
                        viewModel.fetchNews()
                    } else {
                        viewModel.filterArticlesBySearchText()
                    }
                }
            }
        }
    }
}
    
    struct NewsView_Previews: PreviewProvider {
        static var previews: some View {
            NewsView()
        }
    }
