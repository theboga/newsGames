//
//  Home.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 06/04/22.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var itemSelected : Int = 2
    var body: some View {
        TabView (selection: $itemSelected, content: {
            ProfileView().tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }.tag(0)
            GamesView().tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }.tag(1)
            Inicio().tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }.tag(2)
            FavoritosView().tabItem {
                Image(systemName: "heart")
                Text("Favoritos")
            }.tag(3)
        }).accentColor(.white)
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("colorTab"))
        //UITabBar.appearance().barTintColor = UIColor(Color("colorTab"))
        UITabBar.appearance().isTranslucent = true
    }
}

struct Inicio : View {
    @State var textoBusqueda = ""
    var body: some View{
        ZStack{
            Color("colorFondo").ignoresSafeArea()
            VStack{
                HStack{
                    Image("logo-game")
                    Image("logo-name")
                }.padding(.bottom,10.0)
                
                ScrollView{
                    SubModuloInicio()
                }
                
            }.padding(.horizontal,18.0)
                
                
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        
    }
    
    
}

struct SubModuloInicio : View {
    @State var textoBusqueda:String = ""
    @State var isPlayerActive = false
    @State var isGameEmpty = false
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    
    @State var url:String = ""
    @State var titulo:String = ""
    @State var estudio:String = ""
    @State var calificacion:String = ""
    @State var añoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var etiquetas:[String] = [""]
    @State var imagenesUrl:[String] = [""]
    
//    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
//    @State var urlVideos =
//    ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4", "https://dl.dropboxusercontent.com/s/k6g0zwmsxt9qery/TheWitcher480.mp4"]

    var body: some View {
        VStack {
            HStack{
                Button (action: {
                    watchGame(name: textoBusqueda)
                }, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? .gray : Color("colorPrimary"))
                })
                .alert(isPresented: $isGameEmpty) {
                    Alert(title: Text("Buscador"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Ok")))
                }
                ZStack(alignment: .leading) {
                    if textoBusqueda.isEmpty {
                        Text("Buscar un video").foregroundColor(.gray)
                    }
                    TextField("", text: $textoBusqueda).foregroundColor(.white)
                }

            }.padding([.top,.leading,.bottom],11.0).background(Color("colorBlueGray")).clipShape(Capsule())
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.top)
            ZStack{
                Button {
                    watchGame(name: "The Witcher 3")
                } label: {
                    VStack(spacing: 0){
                        Image("titanfall2").resizable().scaledToFill()
                        Text("Titan Fall 2")
                            .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                            .background(Color("colorBlueGray"))
                    }
                }
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.gray).frame(width: 44, height: 44, alignment: .center)

            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            Text("CATEGORÍAS SUGERIDAS PARA TI")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button {
                        //
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("colorBlueGray"))
                                .frame(width: 160, height: 90)
                            Image("rpg")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42, alignment: .center)
                            
                        }
                    }
                    
                    Button {
                        //
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("colorBlueGray"))
                                .frame(width: 160, height: 90)
                            Image("fps")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42, alignment: .center)
                            
                        }
                    }
                    
                    Button {
                        //
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("colorBlueGray"))
                                .frame(width: 160, height: 90)
                            Image("open-world")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42, alignment: .center)
                            
                        }
                    }

                }
            }
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    Button {
                        watchGame(name: "Grand Theft Auto V")
                    } label: {
                        Image("arcry4").resizable().frame(width: 240, height: 135)
                    }
                    
                    Button {
                        watchGame(name: "Halo")
                    } label: {
                        Image("spiderman").resizable().frame(width: 240, height: 135)
                    }
                    
                    Button {
                        watchGame(name: "Abzu")
                    } label: {
                        Image("uncharted4").resizable().frame(width: 240, height: 135)
                    }
                }
            }
        }
        NavigationLink(destination: GameView(url: url, titulo: titulo, estudio: estudio, calificacion: calificacion, añoPublicacion: añoPublicacion, descripcion: descripcion, etiquetas: etiquetas, imagenesUrl: imagenesUrl) , isActive: $isGameViewActive, label: {EmptyView()})
    }
     func watchGame(name:String){
//        print("El usuario Buscó \(name) ")
//        isGameEmpty = true
        juegoEncontrado.search(gameName: name)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){
            print("Juego encontrado: \(juegoEncontrado.gameInfo.count)")
            
            if juegoEncontrado.gameInfo.count == 0 {
                isGameEmpty = true
            } else {
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                estudio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                añoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                etiquetas = juegoEncontrado.gameInfo[0].tags
                imagenesUrl = juegoEncontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true
                
            }
        }
    }
}

struct VideoFrame : View {
    var body: some View{
        VStack{
            Color("colorFondo").ignoresSafeArea()
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        //VideoFrame()
    }
}
