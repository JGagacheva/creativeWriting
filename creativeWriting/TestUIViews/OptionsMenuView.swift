//
//  OptionsMenuView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/23/24.
//

import SwiftUI

struct OptionsMenuView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.timeStamp, ascending: false)], animation: .default)
    private var notes: FetchedResults<Note>

    let delegate: Delegate?
    
//    @State var navigateToEditView = false
   
    
    var body: some View {

        Menu {
            Button("Delete", action: {
                delegate?.deletemeh()
            })
            Button("Edit", action: {
                delegate?.editMe()
            })
            Button("Extend", action: {})
        } label: {
            Label("", systemImage: "ellipsis")
                .foregroundStyle(.white)
        }
    }
}

