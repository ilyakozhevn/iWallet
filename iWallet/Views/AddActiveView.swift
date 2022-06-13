//
//  AddActiveView.swift
//  iWallet
//
//  Created by Ilya Kozhevnikov on 10.06.2022.
//

import SwiftUI

struct AddActiveView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var type = ""
    @State private var account = ""
    @State private var name = ""
    @State private var currency = ""
    @State private var value = 0
    @State private var targetShare = 0
    
    var body: some View {
        Form {
            Section {
                TextField("Active type", text: $type)
                TextField("Active account", text: $account)
                TextField("Active name", text: $name)
                TextField("Active currency", text: $currency)
                
                HStack {
                    Text("Active value:")
                    TextField("Active value", text: Binding(
                        get: { String(value) },
                        set: { value = Int($0) ?? 0 }
                    ))
                }
                
                HStack {
                    Text("Target share:")
                    TextField("Target share", text: Binding(
                        get: { String(targetShare) },
                        set: { targetShare = Int($0) ?? 0 }
                    ))
                }
                
                Spacer()
                Button("Save") {
                    DataController().addActive(
                        type: type,
                        account: account,
                        name: name,
                        currency: currency,
                        value: Double(value),
                        targetShare: Double(targetShare),
                        context: managedObjContext
                    )
                    dismiss()
                }
                
            }
        }
    }
}

struct AddActiveView_Previews: PreviewProvider {
    static var previews: some View {
        AddActiveView()
    }
}
