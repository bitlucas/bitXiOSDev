//
//  Service.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 03/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import Foundation

class Service {
    
    static var urlString : String?
    
    static let session = URLSession.shared
    
    class func getCharacter(onComplete: @escaping (ResponseBody) -> Void){
        guard let url = urlString else { return }
        let dataTask = session.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let json = try JSONDecoder().decode(ResponseBody.self, from: data)
                        onComplete(json)
                    } catch {
                        
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    class func getPlanet(onComplete: @escaping (Planet) -> Void) {
        guard let url = urlString else { return }
        let dataTask = session.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let json = try JSONDecoder().decode(Planet.self, from: data)
                        onComplete(json)
                    } catch {
                        
                    }
                }
            }
        }
        dataTask.resume()
    }
}
