//
//  SeaFeatureDetailViewModel.swift
//  AnimalSeaCreatures


import Foundation
import Combine
import SwiftUI

class InsectDetailViewModel: ObservableObject {
    
    @Published var insect: Value
    @Published var isLove = false
    @Published var hide = false
    
    private var cancellables: [AnyCancellable] = []
    private let isLoveSubject = PassthroughSubject<Value, Never>()
    
    init(insect: Value) {
        self.insect = insect
        self.checkIsLove()
    }
    
    func checkNorthMonth(_ month: Int) -> Color {
        let bool = !insect.availability.monthArrayNorthern.filter({
            $0 == month
        }).isEmpty
        return bool ? Color.green: Color.clear
    }
    
    func checkSourthMonth(_ month: Int) -> Color {
        let bool = !insect.availability.monthArraySouthern.filter({
            $0 == month
            }).isEmpty
        return bool ? Color.green: Color.clear
    }
    
    func checkTime(_ hour: Int) -> Color {
        let bool = !insect.availability.timeArray.filter({
            $0 == hour
            }).isEmpty
        return bool ? Color.green: Color.clear
    }
    
    func checkIsLove() {
        
        $insect
            .map { (insect) -> Bool in
                guard let allData = FishDataManager.shared.fetchAll() else {
                    return false
                }
                let bool = !allData.filter({
                    $0.name == insect.name.nameTWzh
                }).isEmpty
                return bool
        }
        .assign(to: \.isLove, on: self)
        .store(in: &cancellables)
    }
    
    func addLove() {
        FishDataManager.shared.add(insect)
        isLove = true
    }
    
    func deleteLove() {
        guard let allData = FishDataManager.shared.fetchAll() else {
            return
        }
        guard let deleteSea = allData.filter({
            $0.name == insect.name.nameTWzh
        }).first else { return }        
        FishDataManager.shared.delete(deleteSea)
        isLove = false
        NotificationCenter.default.post(name: NSNotification.Name("refresh"), object: nil)
    }
    
    
}
