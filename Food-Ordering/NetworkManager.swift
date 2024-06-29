//
//  NetworkManager.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 29/6/2024.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    private init(){
        
    }
    
    func getAppetizers(completion: @escaping(Result<[Appetizer],APError>)->Void){
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if  let error=error  {
                completion(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else{
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do{
              let decoder = JSONDecoder()
                let decodedData = try decoder.decode(AppetizerResponse.self, from: data)
                completion(.success(decodedData.request))
            }catch{
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
