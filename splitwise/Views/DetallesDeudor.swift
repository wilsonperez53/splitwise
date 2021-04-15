//
//  DetallesDeudor.swift
//  splitwise
//
//  Created by Estudiantes on 4/14/21.
//

import Foundation

import SwiftUI

struct DetallesDeudorView: View {
    let deudor: SplitwiseEntity
    
    @State var montoDolares: String = ""
    @State var montoColones: String = ""
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var coreDataVM = CoreDataViewModel()
    
   
    var body: some View {
        //NavigationView{
        VStack {
            Form{
                Text(deudor.deudor ?? "No Name")
                Text("Total dolares\(deudor.montoDolares)" )
                Text("Total colones \(deudor.montoColones)" )
                
                
                Text("Agregar deuda en dolares")
                TextField("\(deudor.montoDolares)", text: $montoDolares)
                Text("Agregar deuda en colones")
                TextField("\(deudor.montoColones)", text: $montoColones)
            }
            Button(action: Save) {
                HStack {
                    
                    Text("Modificar deudas")
                }
            }
            .foregroundColor(Color.white)
            .padding()
            .background(Color.green)
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Deudas").font(.headline)
                }
            }
        }
    }
        func Save(){
            deudor.montoColones += Double(montoColones) ?? 0
            deudor.montoDolares += Double(montoDolares) ?? 0
            self.coreDataVM.actualizarDeudas(deudor: deudor)
            self.presentationMode.wrappedValue.dismiss()
        }
}

struct DetallesDeudorView_Previews: PreviewProvider {
    static var previews: some View {
        let deudor = SplitwiseEntity()
        DetallesDeudorView(deudor: deudor)
    }
}
