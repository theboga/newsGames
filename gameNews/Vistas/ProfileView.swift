//
//  ProfileView.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 14/04/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color("colorFondo").ignoresSafeArea()
            VStack{
                Text("PERFIL")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom,20)
                ScrollView{
                    Image("foto-prueba")
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100, alignment: .center)
                    Text("Lanie Janecki")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.bottom,30)
                    
                    ModuloAjustes()
                }
            }
        }
    }
}

struct ModuloAjustes: View{
    @State var isNotificaciones = true
    @State var isEditView = false
    var body: some View{
        VStack(spacing:3){
            Text("Ajustes")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame( maxWidth: .infinity,  alignment: .leading)
                .padding(.leading,10)
                .padding(.bottom,15)
            Button {
                
            } label: {
                HStack{
                    Text("Cuenta")
                        .foregroundColor(.white)
                    Spacer()
                    Text(">").foregroundColor(.white)
                }
                .padding(22)
                .background(Color("colorBlueGray"))
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            
            
            Button {
                
            } label: {
                HStack{
                    Text("Notificaciones")
                        .foregroundColor(.white)
                    Spacer()
                    Toggle("", isOn: $isNotificaciones)
                }
                .padding(22)
                .background(Color("colorBlueGray"))
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            
            Button {
                isEditView = true
            } label: {
                HStack{
                    Text("Editar Perfil")
                        .foregroundColor(.white)
                    Spacer()
                    Text(">").foregroundColor(.white)
                }
                .padding(22)
                .background(Color("colorBlueGray"))
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            
            Button {
                
            } label: {
                HStack{
                    Text("Califica esta Aplicación")
                        .foregroundColor(.white)
                    Spacer()
                    Text(">").foregroundColor(.white)
                }
                .padding(22)
                .background(Color("colorBlueGray"))
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            
            NavigationLink(isActive: $isEditView) {
                EditProfileView()
            } label: {
                EmptyView()
            }
            
        }
        

    }
}

struct EditProfile: View{
    @State var pass = ""
    var body: some View{
        ZStack{
            Color("colorFondo").ignoresSafeArea()
            VStack{
                Text("Editar Perfil")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom,20)
                ScrollView{
                    ZStack {
                        Image("foto-prueba")
                            .resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100, alignment: .center)
                        Image(systemName: "camera").foregroundColor(.white)
                    }.padding(.bottom,30)
                    VStack{
                        Text("Nombre")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth:.infinity,alignment: .leading)
                        
                        ZStack(alignment: .leading){
                            if pass.isEmpty {
                                Text("Ingresa Nombre").foregroundColor(.gray)
                            }
                            SecureField("Jack Stear", text: $pass).frame(height: 40).foregroundColor(.white)
                        }.frame(width: 300)
                        Divider()
                            .background(Color("colorPrimary"))
                            .frame(width: 300, height: 1)
                            .padding(.bottom, 5.0)
                        
                        Text("Correo")
                            .foregroundColor(Color("colorPrimary"))
                            .fontWeight(.bold)
                            .frame(maxWidth:.infinity,alignment: .leading)
                        
                        ZStack(alignment: .leading){
                            if pass.isEmpty {
                                Text("Ingresa Correo Electrónico").foregroundColor(.gray)
                            }
                            SecureField("Jack Stear", text: $pass).frame(height: 40).foregroundColor(.white)
                        }.frame(width: 300)
                        Divider()
                            .background(Color("colorPrimary"))
                            .frame(width: 300, height: 1)
                            .padding(.bottom, 5.0)
                        
                        Button(action: {/*  */}, label: {
                            Text("CAMBIAR CONTRASEÑA").fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("colorPrimary"), lineWidth: 2))
                                .shadow(color: Color("colorPrimary"),radius: 8)
                        }).padding(.top,30.0)
                    }.frame( maxWidth: .infinity,  alignment: .leading).padding(.horizontal,20)
                }
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        //EditProfile()
    }
}
