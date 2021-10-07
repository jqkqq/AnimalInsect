//
//  ContentView.swift
//  AnimalSeaCreatures


import SwiftUI


struct ContentView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image("dragonfly")
            }
            MyLoveView()
                .tabItem {
                    Image("love")
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




