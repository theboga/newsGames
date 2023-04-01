//
//  EditProfileView.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 15/04/22.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack{
            Color("colorFondo").ignoresSafeArea()
            VStack{
                Text("Editar Perfil")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom,20)
                ScrollView{
                    Button {
                        
                    } label: {
                        ZStack {
                            Image("foto-prueba")
                                .resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100, alignment: .center)
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                    }.padding(.bottom,30)
                    
                    ModuloDatos()
                    
                }
            }
            
        }
    }
}

struct ModuloDatos: View {
    @State var correo = ""
    @State var pass = ""
    @State var nombre = ""
    var body: some View{
        VStack{
            Text("Correo electrónico")
                .foregroundColor(Color("colorPrimary"))
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth:.infinity,alignment: .leading)
                
            
            ZStack(alignment: .leading){
                if correo.isEmpty {
                    Text("Ingresa correo electrónico").foregroundColor(.gray)
                }
                TextField("", text: $correo).frame(height: 40).foregroundColor(.white)
            }.frame(width: 300)
            Divider()
                .background(Color("colorPrimary"))
                .frame(width: 300, height: 1)
                .padding(.bottom, 5.0)
            
            Text("Contraseña")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth:.infinity,alignment: .leading)
            
            ZStack(alignment: .leading){
                if pass.isEmpty {
                    Text("Ingresa contraseña").foregroundColor(.gray)
                }
                SecureField("", text: $pass).frame(height: 40).foregroundColor(.white)
            }.frame(width: 300)
            Divider()
                .background(Color("colorPrimary"))
                .frame(width: 300, height: 1)
                .padding(.bottom, 5.0)
            
            Text("Nombre")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth:.infinity,alignment: .leading)
            
            ZStack(alignment: .leading){
                if nombre.isEmpty {
                    Text("Ingresa tu nombre").foregroundColor(.gray)
                }
                TextField("", text: $nombre).frame(height: 40).foregroundColor(.white)
            }.frame(width: 300)
            Divider()
                .background(Color("colorPrimary"))
                .frame(width: 300, height: 1)
                .padding(.bottom, 5.0)
            
            VStack{
                Button(action: {actualizarDatos()}, label: {
                    Text("ACTUALIZAR DATOS").fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("colorPrimary"), lineWidth: 2))
                        .shadow(color: Color("colorPrimary"),radius: 8)
                }).padding(.top,30.0)
                
            }
            
            
            
            
            
        }.frame( maxWidth: .infinity,  alignment: .leading).padding(.horizontal,20)
            .onAppear(
                perform:{
                    let xdata = SaveData()
                    let xresult = xdata.recuperarDatos()
                    if !xresult.isEmpty{
                        print("Datos\(xresult)")
                        correo = xresult[0]
                        pass = xresult[1]
                        nombre = xresult[2]
                    } else {
                        print("Registro vacio")
                    }
                
                }
            )
            
    }
    
    func actualizarDatos(){
        
        let objetoActualizadorDatos = SaveData()
        let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, contraseña: pass, nombre: nombre)
        print("Se guardaron los datos del perfil de usuario...\(resultado)")
    }
    
    func verDatos(){
        let myData = SaveData()
        let recuperar = myData.recuperarDatos()
        print("Los datos son \(recuperar)")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
