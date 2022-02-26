//
//  InfoViewCell.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 26.02.2022.
//

import UIKit

class InfoViewCell: UITableViewCell {
    var viewModel: InfoCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.numberBus
            content.secondaryText = viewModel.timeArrival
            contentConfiguration = content
        }
    }
}
