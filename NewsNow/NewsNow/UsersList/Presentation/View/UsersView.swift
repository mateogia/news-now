//
//  UsersView.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//
import SwiftUI

struct UsersView: View {
    @StateObject private var viewModel = UsersViewModel()
    @State private var selectedUser: User?
    
    var body: some View {
        NavigationView {
            Group {
                VStack {
                    Text("Users")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.vertical, 20)
                        .foregroundStyle(.blue)
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else if let errorMessage = viewModel.errorMessage {
                        Text("Error: \(errorMessage)")
                    } else {
                        List(viewModel.users) { user in
                            HStack {
                                VStack {
                                    Text("\(user.firstname) \(user.lastname)")
                                        .font(.title2)
                                        //.frame(alignment: .leading)
                                }
                                .frame(alignment: .center)
                                Spacer()
                                
                                NavigationLink(destination: MapView(user: user)) {}
                            }
                           // .padding(.horizontal)*/
                        }
                        .listStyle(.plain)
                        .padding(.horizontal, 15)
                        //.padding(.bottom, 5)
                        .foregroundStyle(.black, .blue)
                    }
                }
            }
            //.background(Color(red: 150, green: 150, blue: 200))
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
