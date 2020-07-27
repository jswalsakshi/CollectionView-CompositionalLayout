//
//  NetworkingServices.swift
//  CollectionView-CompositionalLayout
//
//  Created by Sakshi Jaiswal on 27/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation


enum NetworkingService {
    static func requestUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/users")!
        ) {
            if let error = $2 {
                completion(.failure(error))
            } else if let data = $0, let user = try? JSONDecoder().decode([User].self, from: data) {
                completion(.success(user))
            }
        }
        task.resume()
    }
}
