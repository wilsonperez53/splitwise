//
//  ListaDeudoresView.swift
//  splitwise
//
//  Created by Estudiantes on 4/14/21.
//

import Foundation
import SwiftUI

struct ListaDeudoresView: View {
    @ObservedObject var coreDataVM = CoreDataViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                
                Text("Lista de deudores").padding()
                    .fixedSize()
                List {
                    ForEach(coreDataVM.contacts, id: \.self) {
                        deudor in
                        NavigationLink(
                            destination: DetallesDeudorView(deudor: deudor),
                            label: {
                                Text(deudor.deudor ?? "Sin Nombre")
                            }
                        )
                       Text(debtStatus(deudor:deudor))
                    }
                }
                HStack {
                    Text("Total en Dolares:")
                    Text("$\(coreDataVM.deudaDolares)" )
                }
                HStack {
                    Text("Total en Colones")
                    Text("₡\(coreDataVM.deudaColones)" )
                }
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Splitwise Clone")
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: AgregarDeudorView()) {
                        Text("Agregar Deudor")
                    }
            )
            .onAppear(perform: {
                self.coreDataVM.obtenerDeudores()
            })
        }
    }
    
    func debtStatus(deudor: SplitwiseEntity)->String{
        var debt = ""
        debt += "Colones:\(deudor.montoColones)"
        debt += "Dolares:\(deudor.montoDolares)"
        
       
        return debt
    }
}

struct ListaDeudoresView_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeudoresView()
    }
}

