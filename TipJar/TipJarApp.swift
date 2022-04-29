//
//  TipJarApp.swift
//  TipJar
//
//  Created by Jumpei Katayama on 2022/02/11.
//

import SwiftUI

@main
struct TipJarApp: App {
    var body: some Scene {
        WindowGroup {
            TipSectionView()
                .environment(\.managedObjectContext, DatabaseManager.instance.container.viewContext)
        }
    }
}
