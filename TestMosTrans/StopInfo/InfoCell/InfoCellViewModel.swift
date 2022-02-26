//
//  InfoCellViewModel.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 26.02.2022.
//

import Foundation

protocol InfoCellViewModelProtocol {
    var numberBus: String { get }
    var timeArrival: String { get }
    init(routePath: RoutePath)
}

class InfoCellViewModel: InfoCellViewModelProtocol {
    var numberBus: String {
        routePath.number
    }
    
    var timeArrival: String {
        routePath.timeArrival.joined(separator: ", ")
    }
    
    private let routePath: RoutePath
    
    required init(routePath: RoutePath) {
        self.routePath = routePath
    }
}
