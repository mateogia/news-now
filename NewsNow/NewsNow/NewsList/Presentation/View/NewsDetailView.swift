//
//  NewsDetailView.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation
import SwiftUI

struct NewsDetailView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(post.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            ScrollView {
                Text(post.content)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
            }
            
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Category: \(post.category)")
                    Text("Status: \(post.status)")
                    Text("Published at: \(post.publishedAt)")
                    Text("Updated at: \(post.updatedAt)")
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .foregroundStyle(.blue)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("NewsNow")
        .padding()
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post(id: 1, slug: "lorem-ipsum", title: "Lorem Ipsum", content: "Lorem ipsum dolor sit amet...", status: "published", category: "lorem", publishedAt: "2023-01-01", updatedAt: "2023-01-02", userIdentifier: 1)
        NewsDetailView(post: post)
    }
}
