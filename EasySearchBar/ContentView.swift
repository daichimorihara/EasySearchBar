//
//  ContentView.swift
//  EasySearchBar
//
//  Created by Daichi Morihara on 2022/02/07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                
                ForEach((1...30).filter({ "\($0)".contains(searchText) || searchText.isEmpty }), id: \.self) { num in
                    HStack {
                        Text("App #\(num)")
                        Spacer()
                    }
                    .padding()
                    Divider()
                        .padding(.leading)
                }
            }
            .navigationTitle("App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
