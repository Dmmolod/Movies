//
//  AppNavigation.swift
//  Movies
//
//  Created by Дмитрий Молодецкий on 04.07.2022.
//

import Foundation
import UIKit

final class AppNavigation: UINavigationController {
    
    init() {
        super.init(rootViewController: MainViewController())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func goToDetailView() {
//        let detailViewController =
    }
    
}
