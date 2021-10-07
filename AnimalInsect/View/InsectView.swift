//
//  SeaFeatureView.swift
//  AnimalSeaCreatures


import SwiftUI
import KingfisherSwiftUI

struct InsectView: View {
    
    var insect: Value
    
    var body: some View {
        VStack {
            KFImage(URL(string: insect.iconURI))
                .resizable()                
                .placeholder({
                    ActivityIndicator()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(Color.gray)
                })
                
            if UIDevice.current.userInterfaceIdiom == .phone {
                Text("\(insect.name.nameTWzh)")
            } else {
                Text("\(insect.name.nameTWzh)")
                    .font(.system(size: 30))
            }
            
        }
    }
}
