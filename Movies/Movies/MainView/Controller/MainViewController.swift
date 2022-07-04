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
    let networkManager = NetworkManager()
    
    var films = [Film]()
    var currentFilmsResponse: FilmsResponse?

    
    override func viewDidLoad() {
        title = "Movies Time"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
        setupFilmTable()
        getFilms()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(filmsTable)
        filmsTable.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
    }
    
    private func setupFilmTable() {
        filmsTable.delegate = self
        filmsTable.dataSource = self
        filmsTable.register(FilmTableCell.self, forCellReuseIdentifier: FilmTableCell.identifier)
    }
    
    private func getFilms() {
        networkManager.fetchFilms(page: nil, category: .nowPlaying) { [weak self] result in
            switch result {
            case .success(let filmsResponse):
                self?.currentFilmsResponse = filmsResponse
                self?.films.append(contentsOf: filmsResponse.results)
                self?.filmsTable.reloadData()
                
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let filmCell = tableView.dequeueReusableCell(withIdentifier: FilmTableCell.identifier,
                                                       for: indexPath) as? FilmTableCell else { return UITableViewCell() }
        return filmCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let categoryView = CategoryView()
        categoryView.delegate = self
        
        return categoryView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

extension MainViewController: CategoryViewDelegate {
    func setupCollectionViewDelegate() -> UICollectionViewDelegate {
        self
    }
    
    func setupCollectionViewDataSource() -> UICollectionViewDataSource {
        self
    }
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        FilmCategory.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.identifier,
                                                      for: indexPath) as? CategoryCollectionCell else { return UICollectionViewCell() }
        
        categoryCell.config(text: FilmCategory.allCases[indexPath.item].nameForView)
        return categoryCell
    }
}
