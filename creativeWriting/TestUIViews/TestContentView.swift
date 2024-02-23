//
//  TestContentView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/22/24.
//

import SwiftUI

struct TestContentView: View {
    
    var body: some View {
        ZStack {
            gradient
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20.0).frame(width: 350, height: 100)
                    Text("Journal Logs")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white).opacity(0.9)
                        .frame(alignment: .topLeading)
                }
                ListView()
            }
        }
        
    }
}

struct TestContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

