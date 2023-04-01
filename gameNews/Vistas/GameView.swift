//
//  GameView.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 12/04/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    var url:String
    var titulo:String
    var estudio:String
    var calificacion:String
    var añoPublicacion:String
    var descripcion:String
    var etiquetas:[String]
    var imagenesUrl:[String]
    
    var body: some View {
        ZStack {
            Color("colorFondo")
                .ignoresSafeArea()
            VStack {
                Video(url: url)
                    .frame(height: 300)
                ScrollView{
                    VideoInfo(titulo: titulo, estudio: estudio, calificacion: calificacion, añoPublicacion: añoPublicacion, descripcion: descripcion, etiquetas: etiquetas, imagenesUrl: imagenesUrl)
                        .padding(.bottom)
                    GaleriaImg(imagenesUrl: imagenesUrl)
                    Text("Comentarios")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(10)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Comentarios(comentarioText: "He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.", userImg: "img", userName: "Juan Carlos Torres", fecha: "hace 7 min")
                    Comentarios(comentarioText: "Por supuesto tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.", userImg: "img", userName: "Martha Cervantes Medina", fecha: "hace 2 días")
                }
            }
        }
    }
}

struct Video: View{
    var url: String
    var body: some View{
        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .ignoresSafeArea()
    }
}

struct VideoInfo: View {
    var titulo:String
    var estudio:String
    var calificacion:String
    var añoPublicacion:String
    var descripcion:String
    var etiquetas:[String]
    var imagenesUrl:[String]
    
    var body: some View{
        VStack (alignment: .leading){
            HStack{
                Text("\(titulo)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(.top,5)
                Spacer()
                Image(systemName: "heart")
                    .foregroundColor(.white)
            }.padding(.horizontal,10)
            HStack{
                Text("\(estudio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.top,5)
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.top,5)
                Text("\(añoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.top,5)
            }.padding(.horizontal,10)
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding()
            HStack{
                ForEach( etiquetas, id: \.self){
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top,5)
                }
            }.padding(.horizontal,10)
        }
    }
}

struct GaleriaImg: View {
    var imagenesUrl:[String]
    let formaGrid = [GridItem(.flexible())]
    var body: some View{
        VStack(alignment: .leading){
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.bold)
                .padding(10)
            ScrollView(.horizontal){
                LazyHGrid(rows: formaGrid,  spacing: 8) {
                    ForEach (imagenesUrl, id:\.self){
                        imgUrl in
                        // Imagenes servidor
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                    }.frame(height: 180)
            
        }.frame( maxWidth: .infinity,  alignment: .leading)
    }
}

//struct Comentario,Codable {
//    var usuarioUrl: String
//    var usuarioNombre: String
//    var fecha: String
//    var comentario: String
//}

struct Comentarios: View{
    var comentarioText: String
    var userImg: String
    var userName: String
    var fecha: String
    
    var body: some View{
        VStack{
//            Text("Comentarios")
//                .foregroundColor(.white)
//                .font(.title2)
//                .fontWeight(.bold)
//                .padding(10)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("colorBlueGray"))
                    .frame( maxWidth: .infinity, alignment: .leading)
                VStack{
                    HStack{
                        Image("foto-prueba").resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44, alignment:.leading)
                            .padding(10)
                        VStack{
                            Text("\(userName)")
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(fecha)")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                    }.frame( maxWidth: .infinity,  alignment: .leading)
                    Text("\(comentarioText)")
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            }.padding(.horizontal,10)
            
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "Ejemplo.com", titulo: "Sonic", estudio: "Sega", calificacion: "e+", añoPublicacion: "1991", descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", etiquetas: ["Runner", "Adventure", "Arcade"],  imagenesUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"] )
    }
}
