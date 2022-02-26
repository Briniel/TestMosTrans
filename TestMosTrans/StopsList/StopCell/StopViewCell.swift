//
//  StopViewCell.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 25.02.2022.
//

import UIKit

class StopViewCell: UITableViewCell {
    @IBOutlet var streatLable: UILabel!
    @IBOutlet var coordinatesLable: UILabel!
    @IBOutlet var idStreatLable: UILabel!

    var viewModel: StopCellViewModelProtocol! {
        didSet {
            streatLable.text = viewModel.streatName
            coordinatesLable.text = viewModel.coordinates
            idStreatLable.text = viewModel.idStreat
        }
    }
}
