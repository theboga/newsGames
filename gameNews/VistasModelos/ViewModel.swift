//
//  ViewModel.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 09/04/22.
//

import Foundation

class ViewModel:ObservableObject {
    @Published var gamesInfo = [Game]()
    
    init(){
        let urlServer = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        var request = URLRequest(url: urlServer)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data{
                    print("Tamaño del json \(jsonData)")
                    
                    let decodeData = try
                    JSONDecoder().decode([Game].self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                }
                //print("Response: \(response)")
                //print("Data: \(data)")
            }catch{
                print("My error:: \(error)")
            }
        }.resume()
        
        
    }
}
