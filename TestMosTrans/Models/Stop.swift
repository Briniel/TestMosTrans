//
//  Stop.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 25.02.2022.
//

import Foundation
import MapKit

struct Data: Decodable {
    let data: [Stop]
}

struct Stop: Decodable {
    let id: String
    let lat: Double
    let lon: Double
    let name: String
    let type: String
    let routePath: [RoutePath]?
}

struct RoutePath: Decodable {
    let id: String
    let type: String
    let number: String
    let timeArrival: [String]
}

class Map: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?

    init(_ stop: Stop) {
        self.title = stop.name
        self.coordinate = CLLocationCoordinate2D(
            latitude: stop.lat,
            longitude: stop.lon)
    }
}
