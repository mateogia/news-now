//
//  HomeTabView.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation
import SwiftUI

struct HomeTabScreen: View {

    var body: some View {
        TabView {
            NewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            UsersView()
                .tabItem {
                    Label("Users", systemImage: "person.3")
                }
        }
    }
}
