//
//  StopTableViewController.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 25.02.2022.
//

import UIKit

class StopsTableViewController: UITableViewController {
    var stops: [Stop] = []

    private var viewModel: StopsListViewModelProtocol! {
        didSet {
            viewModel.getData {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = StopsListViewModel()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let stopInfoVC = segue.destination as? StopInfoViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else {
            return
        }

        stopInfoVC.viwModel = viewModel.detailsViewModel(at: index)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cellStop",
            for: indexPath) as! StopViewCell
        
        cell.viewModel = viewModel.cellViewModel(at: indexPath)

        return cell
    }

}
