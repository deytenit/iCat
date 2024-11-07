//
//  Fetch.swift
//  CatProject
//
//  Created by Vladimir Eremin on 11/8/24.
//

import Foundation

func fetchCat(text: String? = nil, completion: @escaping (Data?) -> Void) {
    let urlString = text != nil && !text!.isEmpty
        ? "https://cataas.com/cat/says/\(text!)?fontSize=50&fontColor=white"
        : "https://cataas.com/cat"
    
    guard let url = URL(string: urlString) else {
        completion(nil)
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
        DispatchQueue.main.async {
            completion(data)
        }
    }
    
    task.resume()
}
