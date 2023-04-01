//
//  FavoritosView.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 14/04/22.
//

import SwiftUI
import AVKit

struct FavoritosView: View {
    @ObservedObject var todosLosJuegos = ViewModel()
    var body: some View {
        ZStack{
            Color("colorFondo").ignoresSafeArea()
            VStack{
                Text("FAVORITOS")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom,10)
                ScrollView{
                    ForEach(todosLosJuegos.gamesInfo, id: \.self) { juego in
                        VStack (spacing:0){
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!))
                                .frame(height: 300)
                            Text("\(juego.title)")
                                .foregroundColor(.white)
                                .padding()
                                .frame( maxWidth: .infinity, alignment: .leading)
                                .background(Color("colorBlueGray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FavoritosView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritosView()
    }
}
