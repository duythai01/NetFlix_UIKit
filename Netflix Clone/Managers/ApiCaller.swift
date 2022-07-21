//
//  ApiCaller.swift
//  Netflix Clone
//
//  Created by Apple on 21/07/2022.
//

import Foundation

struct Constants {
    
    static let API_KEY = "b57a55757c3ae33afe7c09cbeda3194f"
    static let baseURL = "https://api.themoviedb.org/"
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
//                print(results.results[0].original_title)
                completion(.success(results.results))
            }catch{
                print("error:\(error.localizedDescription)")
                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results.results[0].original_title)
                completion(.success(results.results))
            }catch{
                print("error:\(error.localizedDescription)")
                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
        
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results.results[0].original_title)
                completion(.success(results.results))
            }catch{
                print("error:\(error.localizedDescription)")
                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results.results[0].original_title)
                completion(.success(results.results))
            }catch{
                print("error:\(error.localizedDescription)")
                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results.results[0].original_title)
                completion(.success(results.results))
            }catch{
                print("error:\(error.localizedDescription)")
                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
    }
    
    
}


// popular:https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1
//top rated: https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
//up coming: https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1
