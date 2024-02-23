//
//  FrontView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/23/24.
//

import SwiftUI

struct FrontView: View {
    private var sampleTitle: String
    init(_ sampleTitle: String) {
        self.sampleTitle = sampleTitle
    }
    
    var body: some View {
        HStack {
            Text(sampleTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Spacer()
            Text(Date.now.formatted(date: .abbreviated, time: .omitted))
                .foregroundStyle(.white)
        }
    }
}

