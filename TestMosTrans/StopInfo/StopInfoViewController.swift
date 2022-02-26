//
//  ViewController.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 25.02.2022.
//

import MapKit
import UIKit

class StopInfoViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    private var showInformstion = false
    var tableVC = InfoTableView()
    
    var viwModel: StopInfoViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMap(viwModel.getMap())
        tableVC.viewModel = viwModel.ter()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tableVC.dismiss(animated: true)
        super.viewWillDisappear(animated)
    }
    
    private func setUpMap(_ map: Map) {
        mapView.addAnnotation(map)
        mapView.showAnnotations([map], animated: true)
    }
    
    @IBAction func pressSwohInfo(_ sender: UIBarButtonItem) {
        if let sheet = tableVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
        }
        
        if showInformstion {
            dismiss(animated: true)
        } else {
            present(tableVC, animated: true)
        }
        showInformstion.toggle()
    }
}


// MARK: - This is View stop information.

class InfoTableView: UITableViewController {
    var viewModel: InfoTableViewModelProtocol! {
        didSet {
            viewModel.getRoute {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            InfoTableViewHeaderFooterView.self,
            forHeaderFooterViewReuseIdentifier: "sectionIdentifier")
        
        tableView.register(
            InfoViewCell.self,
            forCellReuseIdentifier: "infoCellIdentifier")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberSection()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "sectionIdentifier") as! InfoTableViewHeaderFooterView
        
        header.viewModel = viewModel.sectionViewModel()
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "infoCellIdentifier",
            for: indexPath) as! InfoViewCell
        
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        
        return cell
    }
}
