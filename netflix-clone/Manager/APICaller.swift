//
//  APICaller.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import Foundation

struct constants {
    static let API_KEY = "fe5a2faeacd1a0b9a75a2e379bc0c873"
    static let baseURL = "https://api.themoviedb.org/"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)/3/trending/movie/day?api_key=\(constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                print(results.results[0].overview)
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    func getTrendingTV(completion: @escaping (Result<[TV], Error>) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)/3/trending/tv/day?api_key=\(constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTVResponse.self, from: data)
                completion(.success(results.results))
                print(results.results[0].overview)
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    func getPopularMovie(completion: @escaping (Result<[Popular], Error>) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)/3/movie/popular?api_key=\(constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(PopularMovieResponse.self, from: data)
                completion(.success(results.results))
                print(results.results[0].overview)
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    func getUpcomingMovie(completion: @escaping (Result<[Upcoming], Error>) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)/3/movie/upcoming?api_key=\(constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(UpcomingMovieResponse.self, from: data)
                completion(.success(results.results))
                print(results.results[0].overview)
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    func getToprated(completion: @escaping (Result<[Top], Error>) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)/3/movie/top_rated?api_key=\(constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TopratedResponse.self, from: data)
                completion(.success(results.results))
                print(results.results[0].overview)
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    
}
