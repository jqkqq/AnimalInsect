//
//  HomeView.swift
//  AnimalSeaCreatures


import SwiftUI
import ASCollectionView
import Combine

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationView {
            ASCollectionView(data: viewModel.insects, dataID: \.name) { item, _ in
                NavigationLink(destination: InsectDetailView(insect: item, hide: false)) {
                    InsectView(insect: item)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .layout {
                .grid(layoutMode: .adaptive(withMinItemSize: UIScreen.main.bounds.width / 3),
                      itemSpacing: 5,
                      lineSpacing: 25,
                      itemSize: .absolute(UIScreen.main.bounds.width / 3))
            }
            .background(Color.init(red: 187/255, green: 1, blue: 1))
            .navigationBarTitle("动森虫图鉴", displayMode: .inline)
        }
        
    }
}
