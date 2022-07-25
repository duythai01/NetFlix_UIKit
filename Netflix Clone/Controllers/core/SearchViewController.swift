//
//  SearchViewController.swift
//  Netflix Clone
//
//  Created by Apple on 19/07/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var titles:[Title] = [Title]()
    
    private let searchConTroller: UISearchController = {
       let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Search for a Movies or Tv show"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    private let discoverTable: UITableView = {
      let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(discoverTable)
        
        discoverTable.delegate = self
        discoverTable.dataSource = self
        fetchDiscoverMovies()
        
        navigationItem.searchController = searchConTroller
        searchConTroller.searchResultsUpdater = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }
    
    
    private func fetchDiscoverMovies( ){
        APICaller.shared.getDiscoverMovies(){ [weak self] result in
            
            switch result {
                case .success(let titles):
                    self?.titles = titles
                    DispatchQueue.main.async {
                        self?.discoverTable.reloadData()
                    }
                case .failure(let error):
                    print(error)
            }
        }
        
    }



}
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else { return UITableViewCell()}
        let t = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName:( t.title ?? t.original_title) ?? "unknown", posterURL: t.poster_path ?? "" ))
        
        return cell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160    }
}
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchbar = searchController.searchBar
        guard let query = searchbar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3,
              let resultController = searchController.searchResultsController as? SearchResultViewController else {return}
        
        print(query)
        APICaller.shared.search(with: query){  result in
            DispatchQueue.main.async {
                
                switch result {
                    case .success(let titles):
                        resultController.titles = titles
                        resultController.searchResultCollectionView.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
            }
        
    }
    
}

        
        
