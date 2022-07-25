//
//  ApiCaller.swift
//  Netflix Clone
//
//  Created by Apple on 21/07/2022.
//

import Foundation

struct Constants {
    
    static let API_KEY = "b57a55757c3ae33afe7c09cbeda3194f"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error{
    case failedToGetData
}
class APICaller {
    static let shared = APICaller()
    
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            }catch{
                
                completion(.failure(APIError.failedToGetData ))
            }

        }
        task.resume()
        
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            }catch{
            
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
        
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            }catch{
//                print("error:\(error.localizedDescription)")
//                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            }catch{
//                print("error:\(error.localizedDescription)")
//                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            }catch{
//                print("error:\(error.localizedDescription)")
//                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            }catch{
//                print("error:\(error.localizedDescription)")
//                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
    }
    
    func search( with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            }catch{
//                print("error:\(error.localizedDescription)")
//                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
    }
    
    
}


// popular:https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1
//top rated: https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
//up coming: https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1

//discover" https://api.themoviedb.org/3/discover/movie?api_key=<<api_key>>&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate

//search: https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher
