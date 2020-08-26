//
//  NetworkRequestHandler.swift
//  AltimetricTest
//
//  Created by Sagar Shinde on 23/08/20.
//  Copyright © 2020 Sagar Shinde. All rights reserved.
//

import Foundation

class NetworkRequestHandler  {
    
    let url = "https://itunes.apple.com/search?term=all"
    
    func getAlbums(completion:@escaping(Error?, [Result.Album]?)->()) {
        
        let reqUrl = URL(string: url)
        
        URLSession.shared.dataTask(with: reqUrl!) { (data, response, error) in
            if error == nil {
                do {
                    
                    let result = try JSONDecoder.init().decode(Result.self, from: data!)
                    if result != nil {
                        completion(nil, result.results)
                        return
                    }
                }
                catch {
                    completion(error, nil)
                    return
                }

            }
            completion(error, nil)
        }.resume()
    }
}
