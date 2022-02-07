//
//  SearchBar.swift
//  EasySearchBar
//
//  Created by Daichi Morihara on 2022/02/07.
//

import SwiftUI


struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search terms here", text: $searchText)
                    .padding(.horizontal)
            }
            .padding()
            .background(.gray.opacity(0.4))
            .padding(.horizontal)
            .onTapGesture {
                isSearching = true
            }
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    xButton
                }
                .padding(.horizontal, 24)
                .foregroundColor(.black.opacity(0.5))
            )
            .transition(.move(edge: .trailing))
            .animation(.spring())

            if isSearching {
                cancelButton
            }
            
        }
    }
    
    var xButton: some View {
        Button {
            searchText = ""
        } label: {
            Image(systemName: "xmark.circle.fill")
        }
    }
    
    var cancelButton: some View {
        Button {
            isSearching = false
            searchText = ""
        } label: {
            Text("Cancel")
                .foregroundColor(.blue)
                .padding(.trailing, 10)
        }

    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), isSearching: .constant(true))
    }
}
