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
//                BannerView()
                ListView()
            }
            
        }
        .preferredColorScheme(.dark)
    }
}

struct TestContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

