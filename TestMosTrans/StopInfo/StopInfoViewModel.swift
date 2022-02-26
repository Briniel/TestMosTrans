//
//  StopInfoViewModel.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 26.02.2022.
//

import Foundation

protocol StopInfoViewModelProtocol: AnyObject {
    init(stop: Stop)
    func getMap() -> Map
    func ter() -> InfoTableViewModelProtocol
}

class StopInfoViewModel: StopInfoViewModelProtocol {
    private let stop: Stop
    
    required init(stop: Stop) {
        self.stop = stop
    }
    
    func getMap() -> Map {
        Map(stop)
    }
    
    func ter() -> InfoTableViewModelProtocol {
        InfoTableViewModel(stop: stop)
    }
    
}

// MARK: - Info Table Model

protocol InfoTableViewModelProtocol: AnyObject {
    var routePaths: [RoutePath] { get }
    var name: String { get }
    init(stop: Stop)
    func getRoute(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func numberSection() -> Int
    func sectionViewModel() -> InfoTableViewHeaderFooterViewModelProtocol
    func cellViewModel(at indexPath: IndexPath) -> InfoCellViewModelProtocol
}

class InfoTableViewModel: InfoTableViewModelProtocol {
    var routePaths: [RoutePath] = []
    
    var name: String {
        stop.name
    }
    
    private let stop: Stop
    
    required init(stop: Stop) {
        self.stop = stop
    }
    
    func getRoute(completion: @escaping () -> Void) {
        NetworkManager.shared.getInformationStop(id: stop.id) { stop in
            guard let route = stop.routePath else { return }
            self.routePaths = route
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        routePaths.count
    }
    
    func numberSection() -> Int {
        1
    }
    
    func sectionViewModel() -> InfoTableViewHeaderFooterViewModelProtocol {
        InfoTableViewHeaderFooterViewModel(stop: stop)
    }
    
    func cellViewModel(at indexPath: IndexPath) -> InfoCellViewModelProtocol {
        let routePath = routePaths[indexPath.row]
        return InfoCellViewModel(routePath: routePath)
    }
    
    
}
