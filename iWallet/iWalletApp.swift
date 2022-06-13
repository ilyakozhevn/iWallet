//
//  iWalletApp.swift
//  iWallet
//
//  Created by Ilya Kozhevnikov on 07.06.2022.
//

import SwiftUI

@main
struct iWalletApp: App {
    @StateObject private var dataControler = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataControler.container.viewContext)
        }
    }
}
