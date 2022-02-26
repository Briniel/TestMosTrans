//
//  InfoTableViewHeaderFooterViewModel.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 26.02.2022.
//

import Foundation

protocol InfoTableViewHeaderFooterViewModelProtocol {
    var nameStop: String { get }
    init(stop: Stop)
}

class InfoTableViewHeaderFooterViewModel: InfoTableViewHeaderFooterViewModelProtocol {
    var nameStop: String {
        stop.name
    }

    private let stop: Stop

    required init(stop: Stop) {
        self.stop = stop
    }
}
