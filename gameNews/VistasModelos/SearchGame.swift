//
//  SearchGame.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 14/04/22.
//

import Foundation
class SearchGame: ObservableObject {
    
    @Published var gameInfo = [Game]()
    
    func search(gameName:String){
        gameInfo.removeAll()
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        let urlServer = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        var request = URLRequest(url: urlServer)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data{
                    print("Tamaño del json \(jsonData)")
                    
                    let decodeData = try
                    JSONDecoder().decode(Resultados.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
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
