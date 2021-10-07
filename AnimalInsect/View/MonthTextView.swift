//
//  MonthTextView.swift
//  AnimalSeaCreatures


import SwiftUI

struct MonthTextView: View {
    
    @State var color: Color
    var month: Int {
        didSet {
            if month > 12 || month < 1 {
                month = 12
            }
        }
    }
    
    var body: some View {
        Text("\(month)月")
            .tag(month)
            .font(.system(size: 25))
            .frame(minWidth: 0,  maxWidth: .infinity, alignment: .center)
            .border(Color.gray)
            .background(color)
    }
}
