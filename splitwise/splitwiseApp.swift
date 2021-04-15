//
//  splitwiseApp.swift
//  splitwise
//
//  Created by Estudiantes on 4/14/21.
//

import SwiftUI

@main
struct splitwiseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListaDeudoresView()
        }
    }
}
