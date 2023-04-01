//
//  GamesView.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 08/04/22.
//AsyncImage(url: URL(string: juego.galleryImages[0])).aspectRatio(contentMode: .fit).clipShape(RoundedRectangle.init(cornerRadius: 12))
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    @ObservedObject var todoData = ViewModel()
    @State var url:String = ""
    @State var gameViewIsActive:Bool = false
    @State var titulo:String = ""
    @State var estudio:String = ""
    @State var calificacion:String = ""
    @State var añoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var etiquetas:[String] = [""]
    @State var imagenesUrl:[String] = []
    
    let formaGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        ZStack {
            Color("colorFondo")
                .ignoresSafeArea()
            VStack{
                Text("JUEGOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                ScrollView{
                    LazyVGrid(columns: formaGrid, spacing: 8) {
                        ForEach(todoData.gamesInfo, id: \.self){
                            juego in
                            Button {
                                url = juego.videosUrls.mobile
                                titulo = juego.title
                                estudio = juego.studio
                                calificacion = juego.contentRaiting
                                añoPublicacion = juego.publicationYear
                                descripcion = juego.description
                                etiquetas = juego.tags
                                imagenesUrl = juego.galleryImages
                                
                                print(titulo)
                                print(imagenesUrl[0])
                                gameViewIsActive = true

                            } label: {
                                KFImage(URL(string: juego.galleryImages[0])).resizable().aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 12)).padding(.bottom,12)

                            }

                        }
                    }
                }
            }.padding(.horizontal,6)
            
            NavigationLink(destination: GameView(url: url, titulo: titulo, estudio: estudio, calificacion: calificacion, añoPublicacion: añoPublicacion, descripcion: descripcion, etiquetas: etiquetas, imagenesUrl: imagenesUrl), isActive: $gameViewIsActive) {
                EmptyView()
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            //print("Primer JSON \(todoData.gamesInfo[0])")
            //print("Primer video del Json \(todoData.gamesInfo[0].title)")
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
