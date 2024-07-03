//
//  NetworkManager.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 29/6/2024.
//

import UIKit
import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let cache = NSCache<NSString,UIImage>()
    
    private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    private init(){
        
    }
    
//            func getAppetizers(completion: @escaping(Result<[Appetizer],APError>)->Void){
//                guard let url = URL(string: baseURL) else {
//                    completion(.failure(.invalidURL))
//                    return
//                }
//                let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//
//                    if  let error=error  {
//                        completion(.failure(.unableToComplete))
//                        return
//                    }
//                    guard let response = response as? HTTPURLResponse, response.statusCode == 200  else{
//                        completion(.failure(.invalidResponse))
//                        return
//                    }
//                    guard let data = data else {
//                        completion(.failure(.invalidData))
//                        return
//                    }
//                    do{
//                      let decoder = JSONDecoder()
//                        let decodedData = try decoder.decode(AppetizerResponse.self, from: data)
//                        completion(.success(decodedData.request))
//                    }catch{
//                        completion(.failure(.invalidData))
//                    }
//                }
//                task.resume()
//            }
    
    func getAppetizers()async throws ->[Appetizer] {
        guard let url = URL(string: baseURL) else {
            throw APError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else{
                throw APError.invalidResponse
            }
      
            do{
              let decoder = JSONDecoder()
                let decodedData = try decoder.decode(AppetizerResponse.self, from: data)
                return decodedData.request
            }catch{
                throw APError.invalidData
            
        }
    }
    func downloadImage(from urlString:String, completion: @escaping(UIImage?)->Void){
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completion(image)
            return
        }
        guard let url = URL(string: urlString)  else{
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else{
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        task.resume()

    }
}
