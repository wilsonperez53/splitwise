//
//  AgregarDeudor.swift
//  splitwise
//
//  Created by Estudiantes on 4/14/21.
//

import Foundation
import SwiftUI

struct AgregarDeudorView: View {
    @State var nombreDeudor: String = ""
    
    @State var debeDolares: String = ""
    @State var debeColones: String = ""
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var coreDataVM = CoreDataViewModel()
    
   
    var body: some View {
        //NavigationView{
        VStack {
            Form{
                Text("Nombre del deudor")
                TextField("Nombre", text: $nombreDeudor)
           
                Text("Agregar deuda en dolares")
                TextField("", text: $debeDolares)
                Text("Agregar deuda en colones")
                TextField("", text: $debeColones)
            }
            Button(action: Save) {
                    Text("Agregar")

            }
            .foregroundColor(Color.white)
            .padding()
            .background(Color.green)
     
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Agregar nuevo Deudor").font(.headline)
                }
            }
        }
        
        
    }
    func Save(){
        self.coreDataVM.agregarDeudor(nombreDeudor: nombreDeudor)
        
        //deudor.montoColones += Double(debeColones) ?? 0
        //deudor.montoDolares += Double(debeDolares) ?? 0
        //self.coreDataVM.actualizarDeudas(deudor: deudor)
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarDeudorView()
    }
}
