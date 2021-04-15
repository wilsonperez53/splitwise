//
//  CoreDataViewModel.swift
//  splitwise
//
//  Created by Estudiantes on 4/14/21.
//

import Foundation

class CoreDataViewModel: ObservableObject{
    @Published var coreDM = CoreDataManager()
    @Published var contacts: [SplitwiseEntity] = [SplitwiseEntity]()
    @Published var deudaDolares: Double = 0
    @Published var deudaColones: Double = 0
    
    
    func agregarDeudor(nombreDeudor: String){
        //Validations
        coreDM.agregarDeudor(nombreDeudor:  nombreDeudor)
    }
    
    func obtenerDeudores(){
        contacts = self.coreDM.getAllContacts()
        
        deudaDolares = 0
        deudaColones = 0
        
        contacts.forEach{ deudor in
            deudaDolares += deudor.montoDolares
            deudaColones += deudor.montoColones
        }
    }
  
    func actualizarDeudas(deudor: SplitwiseEntity){
        coreDM.actualizarDeudas(deudor: deudor)
    }
    
    func saveContext(){
        coreDM.saveContext()
    }
    
}
