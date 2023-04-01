//
//  SaveData.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 15/04/22.
//

import Foundation

class SaveData {
    var correo: String = ""
    var contraseña: String = ""
    var nombre: String = ""
    
    func guardarDatos(correo:String, contraseña:String, nombre:String)->Bool {
        print("Guardar en data correo: \(correo) + contraseña: \(contraseña) + nombre: \(nombre)")
        
        //Guardar Datos
        UserDefaults.standard.set([correo,contraseña,nombre], forKey: "perfilData")
        return true
    }
    
    func recuperarDatos()->[String]{
        let datosUsusario:[String] = UserDefaults.standard.stringArray(forKey: "perfilData")!
        print("Recuperar Datos: \(datosUsusario)")
        
        return datosUsusario
    }
    
    func validarDatos(correo:String, contraseña:String)->Bool{
        var correoGuardado = ""
        var contraseñaGuardada = ""
        
        print("Revisando datos correo:\(correo) y pass \(contraseña)")
        if UserDefaults.standard.object(forKey: "perfilData") != nil {
            correoGuardado = UserDefaults.standard.stringArray(forKey: "perfilData")![0]
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "perfilData")![1]
            print("El correo guardado es: \(correoGuardado) y la contraseña: \(contraseñaGuardada)")
            if (correo.uppercased() == correoGuardado.uppercased() && contraseña == contraseñaGuardada){
                return true
            } else {
                return false
            }
            
        } else {
            print("No hay datos")
            return false
        }
    }
}
