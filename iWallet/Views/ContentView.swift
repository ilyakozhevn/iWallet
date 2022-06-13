//
//  ContentView.swift
//  iWallet
//
//  Created by Ilya Kozhevnikov on 07.06.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.targetShare, order: .reverse)]) var active: FetchedResults<Active>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Int(totalValue())) RUR")
                List {
                    ForEach(active) { active in NavigationLink(destination: Text("\(active.name!)")) {
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(active.name!)
                                    .bold()
                                Text("\(active.account!) \(active.type!)")
                            }
                            Spacer()
                            Text("\(Int(active.value)) \(active.currency!)")
                        }
                    }
                        
                    }
                    .onDelete(perform: deleteActive )
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Actives")
//        .foregroundColor(.black)

    }
    private func deleteActive(offsets: IndexSet) {
//        pas
    }
    
    private func totalValue() -> Int {
        0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
