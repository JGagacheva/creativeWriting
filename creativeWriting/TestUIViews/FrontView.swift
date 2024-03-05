//
//  FrontView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/23/24.
//

import SwiftUI

struct FrontView: View {
    private let sampleTitle: String
    private let sampleDate: Date
    
    init(_ sampleTitle: String, sampleDate: Date) {
        self.sampleTitle = sampleTitle
        self.sampleDate = sampleDate
    }
    
    var body: some View {
        HStack {
            Text(sampleTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Spacer()
            Text(sampleDate.formatted(date: .abbreviated, time: .omitted))
                .foregroundStyle(.white)
        }
    }
}

