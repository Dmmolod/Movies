//
//  MainViewController.swift
//  Movies
//
//  Created by Дмитрий Молодецкий on 04.07.2022.
//

import Foundation
import UIKit

final class MainViewController: UIViewController {
    
    let filmsTable = UITableView()
    
    override func viewDidLoad() {
        title = "Movies Time"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func commonInit() {
        view.addSubview(filmsTable)
        filmsTable.
    }
}
