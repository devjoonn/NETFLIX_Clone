//
//  APICaller.swift
//  Netflix Clone
//
//  Created by 박현준 on 2023/01/05.
//

import Foundation

struct constants {
    static let API_KEY = "74cc7e95a584748e85f44fbd362de40a"
    static let baseURL = "https://api.themoviedb.org"
    
}

enum APIError: Error {
    case failedToGetData
}
 
class APICaller {
    static let shared = APICaller()
 
    // trendMovie 데이터 가져옴
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(constants.baseURL)/3/trending/all/day?api_key=\(constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            //에러처리
            do {
                //데이터 JSON 가져옴 -> 확인
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                
                //JSON 데이터를 Movie모델에 맞게 디코딩
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
//                print(results.results[0])
                // []
                completion(.success(results.results)) // 첫번째 results는 위에 let result, 두번째 results는 Movie 모델을 result[Movie]로 넣음
            } catch {
//                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
 
