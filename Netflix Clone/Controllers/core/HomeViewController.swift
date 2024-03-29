//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Apple on 19/07/2022.
//

import UIKit


enum Sections: Int{
    case TrendingMovies = 0
    case Popular = 1
    case TrendingTv = 2
   
    case Upcoming = 3
    case TopRated = 4
    
}



class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Trending Movies","Popular","Trending TV", "Upcoming Movies", "Top rated"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configNavbar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        homeFeedTable.tableHeaderView = headerView
        
        APICaller.shared.getMovie(with: "Harry" ) { reuslt in
            //
        }
//        getTrendingMovies()
//        getTrendingTv()
//
    }
    private func configNavbar(){
        var image = UIImage(named: "netflix_logo")
        
        image = image?.withRenderingMode(.alwaysOriginal)
//        navigationItem.setLeftBarButtonItems(<#T##items: [UIBarButtonItem]?##[UIBarButtonItem]?#>, animated: <#T##Bool#>)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:  image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
//        navigationController?.pushViewController(TitlePreviewViewController(), animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
//    private func getTrendingMovies() {
//        APICaller.shared.getTrendingMovies{results in
//            switch results {
//                case.success(let movies):
//                    print(movies)
//                case.failure(let error):
//                    print(error)
//            }
//        }
//    }
//
//
//    private func getTrendingTv() {
//        APICaller.shared.getTrendingTvs{results in
////            switch results {
////                case.success(let movies):
////                    print(movies)
////                case.failure(let error):
////                    print(error)
////            }
//        }
//    }
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    // Tra ve sectionTitles.count hang
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    // moi hang thi chi co 1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        cell.delegate = self
        switch indexPath.section {
            case Sections.TrendingMovies.rawValue:
                APICaller.shared.getTrendingMovies{ result in
                    switch result{
                        case .success(let titles):
                            cell.configure(with: titles)
                        case .failure(let error):
                            print(error.localizedDescription)
                          
                    }
                }
            case Sections.Popular.rawValue:
                APICaller.shared.getPopularMovies{ result in
                    switch result{
                        case .success(let titles):
                            cell.configure(with: titles)
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }
            case Sections.TrendingTv.rawValue:
                APICaller.shared.getTrendingTvs{ result in
                    switch result{
                        case .success(let titles):
                            cell.configure(with: titles)
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }
            case Sections.Upcoming.rawValue:
                APICaller.shared.getUpcomingMovies{ result in
                    switch result{
                        case .success(let titles):
                            cell.configure(with: titles)
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }
            case Sections.TopRated.rawValue:
                APICaller.shared.getTopRatedMovies{ result in
                    switch result{
                        case .success(let titles):
                            cell.configure(with: titles)
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }
            default:
                return UITableViewCell()
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40   }
    // An than navaigation bar
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else{return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
}
extension HomeViewController: CollectionViewTableViewCellDelegate {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewModel) {
        DispatchQueue.main.async {
            [weak self] in
            let vc = TitlePreviewViewController()
            vc.configure(with: viewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
      
    }
}
