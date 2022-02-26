//
//  InfoTableViewHeaderFooterView.swift
//  TestMosTrans
//
//  Created by Михаил Иванов on 26.02.2022.
//

import UIKit

class InfoTableViewHeaderFooterView: UITableViewHeaderFooterView {
    var viewModel: InfoTableViewHeaderFooterViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.nameStop
            contentConfiguration = content
        }
    }
}
