//
//  APIManager.swift
//  AnimalSeaCreatures

import Foundation
import Alamofire
import Combine

enum APIError: Error {
    case responseError
    case parseError(Error)
}

class APIManager {
    
    static let shared = APIManager()
    
    func loadData(completion: @escaping([Value]) -> ()) {
        AF.request("http://acnhapi.com/v1/bugs").response { (response) in
            if let data = response.data {
                do {
                    let seaFeaturies = try JSONDecoder().decode(Insect.self, from: data)
                    let featuries = seaFeaturies
                        .map({
                            $0.value
                        }).sorted(by: {
                            $0.id < $1.id
                        })
                    completion(featuries)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func loadSeaFeature() -> AnyPublisher<Insect, Error> {
        return
            URLSession.shared.dataTaskPublisher(for: URL(string: "http://acnhapi.com/v1/bugs")!)
                .map(\.data)
                .mapError({ (error) -> Error in
                    APIError.responseError
                })
                .decode(type: Insect.self, decoder: JSONDecoder())
                .mapError({ (error) -> Error in
                    APIError.parseError(error)
                })
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
    }
}
