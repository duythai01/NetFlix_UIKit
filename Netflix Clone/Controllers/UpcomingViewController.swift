//
//  UpcomingViewController.swift
//  Netflix Clone
//
//  Created by Apple on 19/07/2022.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    private var titles:[Title] = [Title]()
    
    private let upcomingTable: UITableView = {
      let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        fetchUpcoming()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
        
    }
    
    
    private func fetchUpcoming( ){
        APICaller.shared.getUpcomingMovies(){ [weak self] result in
            
            switch result {
                case .success(let titles):
                    self?.titles = titles
                    DispatchQueue.main.async {
                        self?.upcomingTable.reloadData()
                    }
                case .failure(let error):
                    print(error)
            }
        }
        
    }


}
extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
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
        return 140
    }
}
