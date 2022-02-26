//
//  StopCellViewModel.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 26.02.2022.
//

import Foundation

protocol StopCellViewModelProtocol {
    var streatName: String { get }
    var coordinates: String { get }
    var idStreat: String { get }
    init(stop: Stop)
}

class StopCellViewModel: StopCellViewModelProtocol {
    var streatName: String {
        stop.name
    }
    
    var coordinates: String {
        "\(stop.lon) \(stop.lat)"
    }
    
    var idStreat: String {
        stop.id
    }
    
    private let stop: Stop
    
    required init(stop: Stop) {
        self.stop = stop
    }
}
