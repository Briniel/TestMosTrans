//
//  StopsTableViewModel.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 26.02.2022.
//

import Foundation

protocol StopsListViewModelProtocol: AnyObject {
    var stops: [Stop] { get }
    func getData(completion: @escaping () -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> StopCellViewModelProtocol
    func detailsViewModel(at indexPath: IndexPath) -> StopInfoViewModelProtocol
}

class StopsListViewModel: StopsListViewModelProtocol {
    var stops: [Stop] = []
    
    func getData(completion: @escaping () -> Void) {
        NetworkManager.shared.getData { stop in
            self.stops = stop.data
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        stops.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> StopCellViewModelProtocol {
        let stop = stops[indexPath.row]
        return StopCellViewModel(stop: stop)
    }
    
    func detailsViewModel(at indexPath: IndexPath) -> StopInfoViewModelProtocol {
        let stop = stops[indexPath.row]
        return StopInfoViewModel(stop: stop)
    }
}
