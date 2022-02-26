//
//  NetworkManager.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 25.02.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let api = "https://api.mosgorpass.ru/v8.2/stop"
    
    private init() {}
    
    func getData(completion: @escaping (_ stop: Data) -> Void) {
        guard let url = URL(string: api) else {
            print("Error URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("Error data: ")
                print(error?.localizedDescription ?? "No Description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode(Data.self, from: data)
                DispatchQueue.main.async {
                    completion(courses)
                }
            } catch {
                print("Error serialization json: ", error)
            }
        }.resume()
    }
    
    func getInformationStop(id: String, completion: @escaping (_ stop: Stop) -> Void) {
        guard let url = URL(string: api + "/\(id)") else {
            print("Error URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("Error data: ")
                print(error?.localizedDescription ?? "No Description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode(Stop.self, from: data)
                DispatchQueue.main.async {
                    completion(courses)
                }
            } catch {
                print("Error serialization json: ", error)
            }
        }.resume()
    }
}
