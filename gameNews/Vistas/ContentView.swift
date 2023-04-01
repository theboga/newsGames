//
//  ContentView.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 01/04/22.
//

import SwiftUI

struct ContentView: View {
    @State var esInicioSesion = true
    var body: some View {
        
        NavigationView{
            ZStack{
                Color("colorFondo").ignoresSafeArea()
                VStack{
                    HStack{
                        Image("logo-game")
                        Image("logo-name")
                    }.padding(.bottom,50.0)
                    
                    HStack{
                        Spacer()
                        VStack{
                            Button {
                                esInicioSesion = true
                            } label: {
                                Text("INICIAR SESIÓN").fontWeight(.heavy).foregroundColor(esInicioSesion ? .white : .gray)
                            }
                            Divider().background(Color(esInicioSesion ? "colorPrimary" :"colorFondo"))
                        }
                        Spacer()
                        VStack{
                            Button {
                                esInicioSesion = false
                            } label: {
                                Text("REGÍSTRATE").fontWeight(.heavy).foregroundColor(esInicioSesion ? .gray : .white)
                            }
                            Divider().background(Color(esInicioSesion ? "colorFondo" : "colorPrimary"))
                        }
                        Spacer()

                    }.padding(.bottom, 50.00)
                    ScrollView{

                        if esInicioSesion {
                            IniciarSesionView()
                        } else {
                            RegistroView()
                        }
                    }
                    
                    Spacer()
                    
                }
            }.navigationBarHidden(true)
        }
        
    }
}

struct IniciarSesionView: View {
    @State var correo = ""
    @State var pass = ""
    @State var isHomeActive: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Text("Correo electrónico")
                .fontWeight(.heavy)
                .foregroundColor(Color("colorPrimary"))
                .multilineTextAlignment(.leading)
            ZStack(alignment: .leading){
                if correo.isEmpty {
                    Text("Correo electrónico").foregroundColor(.gray)
                }
                TextField("", text: $correo).frame(height: 40).foregroundColor(.white)
            }.frame(width: 300)
            Divider()
                .background(Color("colorPrimary"))
                .frame(width: 300, height: 1)
                .padding(.bottom, 20.0)
                
        }
        VStack(alignment: .leading){
            Text("Contraseña")
                .fontWeight(.heavy)
                .foregroundColor(Color("colorPrimary"))
                .multilineTextAlignment(.leading)
            ZStack(alignment: .leading){
                if pass.isEmpty {
                    Text("Contraseña").foregroundColor(.gray)
                }
                SecureField("", text: $pass).frame(height: 40).foregroundColor(.white)
            }.frame(width: 300)
            Divider()
                .background(Color("colorPrimary"))
                .frame(width: 300, height: 1)
                .padding(.bottom, 5.0)
            
            
        }
        VStack{
            Text("¿Olvidaste tu Contraseña?").foregroundColor(Color("colorPrimary")).font(.footnote).frame(width: 300, alignment: .trailing)
                .padding(.bottom,20.0)
            Button(action: iniciarSesion, label: {
                Text("INICIAR SESION").fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("colorPrimary"), lineWidth: 2))
                    .shadow(color: Color("colorPrimary"),radius: 8)
            }).padding(.bottom,30.0)
            Text("Inicia Sesión con Redes Sociales").foregroundColor(.gray)
            HStack{
                Button(action: facebook, label: {
                    HStack{
                        Text("Facebook").foregroundColor(.white).padding(EdgeInsets(top: 8, leading: 30, bottom: 8, trailing: 30)).background(Color("colorBlueGray"))
                            .cornerRadius(8)
                    }
                })
                Button(action: twitter, label: {
                    HStack{
                        Text("Twitter").foregroundColor(.white).padding(EdgeInsets(top: 8, leading: 40, bottom: 8, trailing: 40)).background(Color("colorBlueGray"))
                            .cornerRadius(8)
                    }
                })
            }
        }.frame(width: 300, alignment: .center)
        NavigationLink(destination: Home(), isActive: $isHomeActive) {
            EmptyView()
        }
    }
    func iniciarSesion(){
        //
        print("Iniciando Sesión correo:\(correo) pass:\(pass)")
        let myData = SaveData()
        let validar = myData.validarDatos(correo: correo, contraseña: pass)
        isHomeActive = validar
    }
}



func twitter(){
    //
}
func facebook(){
    //
}
func tomarFoto(){
    //
}

struct RegistroView : View{
    @State var correo = ""
    @State var pass = ""
    @State var confirmaPass = ""
    @State var alertError = false
    @State var msgAlerta = ""
    @State var titleAlerta = ""
    @State var isHomeActive = false
    var body: some View {
        VStack{
            Text("Elije una foto de perfil")
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.bottom,3)
            Text("Puedes cambiar o elegirla más adelante")
                .foregroundColor(.gray)
                .font(.footnote)
            Button(action: tomarFoto, label: {
                ZStack{
                    Image("foto-prueba")
                    Image(systemName: "camera").foregroundColor(.white)
                }
            }).padding(.bottom,30)
        }
        VStack(alignment: .leading){
            Text("Correo electrónico *")
                .fontWeight(.heavy)
                .foregroundColor(Color("colorPrimary"))
                .multilineTextAlignment(.leading)
            ZStack(alignment: .leading){
                if correo.isEmpty {
                    Text("Correo electrónico").foregroundColor(.gray)
                }
                TextField("", text: $correo).frame(height: 40).foregroundColor(.white)
            }.frame(width: 300)
            Divider()
                .background(Color("colorPrimary"))
                .frame(width: 300, height: 1)
                .padding(.bottom, 20.0)
                
        }
        VStack(alignment: .leading){
            Text("Contraseña *")
                .fontWeight(.heavy)
                .foregroundColor(Color("colorPrimary"))
                .multilineTextAlignment(.leading)
            ZStack(alignment: .leading){
                if pass.isEmpty {
                    Text("Contraseña").foregroundColor(.gray)
                }
                SecureField("", text: $pass).frame(height: 40).foregroundColor(.white)
            }.frame(width: 300)
            Divider()
                .background(Color("colorPrimary"))
                .frame(width: 300, height: 1)
                .padding(.bottom, 5.0)
            
            
        }
        VStack(alignment: .leading){
            Text("Confirmar Contraseña *")
                .fontWeight(.heavy)
                .foregroundColor(Color("colorPrimary"))
                .multilineTextAlignment(.leading)
            ZStack(alignment: .leading){
                if confirmaPass.isEmpty {
                    Text("Confirma tu Contraseña").foregroundColor(.gray)
                }
                SecureField("", text: $confirmaPass).frame(height: 40).foregroundColor(.white)
            }.frame(width: 300)
            Divider()
                .background(Color("colorPrimary"))
                .frame(width: 300, height: 1)
                .padding(.bottom, 5.0)
            
            
        }
        VStack{
            Text("").foregroundColor(Color("colorPrimary")).font(.footnote).frame(width: 300, alignment: .trailing)
                .padding(.bottom,20.0)
            
            
            Button(action: registroUsuario, label: {
                Text("REGÍSTRATE").fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("colorPrimary"), lineWidth: 2))
                    .shadow(color: Color("colorPrimary"),radius: 8)
            })
            .padding(.bottom,30.0)
            .alert(isPresented: $alertError) {
                Alert(title: Text("\(titleAlerta)"), message: Text("\(msgAlerta)"), dismissButton: .default(Text("Volver")))
            }
            
            
            
            Text("Regístrate con Redes Sociales").foregroundColor(.gray)
            HStack{
                Button(action: facebook, label: {
                    HStack{
                        Text("Facebook").foregroundColor(.white).padding(EdgeInsets(top: 8, leading: 30, bottom: 8, trailing: 30)).background(Color("colorBlueGray"))
                            .cornerRadius(8)
                    }
                })
                Button(action: twitter, label: {
                    HStack{
                        Text("Twitter").foregroundColor(.white).padding(EdgeInsets(top: 8, leading: 40, bottom: 8, trailing: 40)).background(Color("colorBlueGray"))
                            .cornerRadius(8)
                    }
                })
            }
        }.frame(width: 300, alignment: .center)
        NavigationLink(destination: Home(), isActive: $isHomeActive) {
            EmptyView()
        }
    }
    
    func registroUsuario(){
        //
        if (pass == "" || correo == ""){
            titleAlerta = "Error"
            msgAlerta = "Favor de llenar todos los campos"
            alertError = true
            return
        }
        if ( !correo.contains("@")){
            titleAlerta = "Error"
            msgAlerta = "Favor de llenar un correo válido"
            alertError = true
            return
        }
        if pass == confirmaPass {
            let myData = SaveData()
            let resultado = myData.guardarDatos(correo: correo, contraseña: pass, nombre: "")
            print("Registro de Usuario correo:\(correo) pass:\(pass) fue \(resultado)")
//            msgAlerta = "Registro Exitoso"
//            titleAlerta = "Guardado"
//            alertError = true
            isHomeActive = true
        } else {
            titleAlerta = "Error"
            msgAlerta = "Las contraseñas no coinciden"
            alertError = true
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Image("pantalla2").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
        }
        ContentView()
            
    }
}
