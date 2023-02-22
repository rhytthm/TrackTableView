//
//  Parser.swift
//  DemoProject
//
//  Created by Rhytthm on 22/02/23.
//

import Foundation

class Parser{
    func parser(urlString: String, CompletionHandler:@escaping((Welcome)->Void)){
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            guard let data = data, err == nil else { return }
            
            do {
                let json = try JSONDecoder().decode(Welcome.self, from: data)
                CompletionHandler(json)
            } catch let jsonErr {
                print("failed to decode json:", jsonErr)
            }
            
        }.resume()
    }
}
