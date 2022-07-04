//
//  FilmTableCell.swift
//  Movies
//
//  Created by Дмитрий Молодецкий on 04.07.2022.
//

import Foundation
import UIKit

final class FilmTableCell: UITableViewCell {
    
    let poster = UIImageView()
    let title = UILabel()
    let voteAverage = UILabel()
    let releaseDate = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(
    
}
