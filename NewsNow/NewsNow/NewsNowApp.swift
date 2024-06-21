//
//  NewsNowApp.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import SwiftUI

@main
struct NewsNowApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            HomeTabScreen()
        }
    }
}
