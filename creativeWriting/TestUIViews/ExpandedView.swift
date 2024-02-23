//
//  ExpandinView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/21/24.
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

struct ExpandedView: View {
    
    let sampleBody: String
    init(_ sampleBody: String) {
        self.sampleBody = sampleBody
    }
    
    
    @State private var scrollViewContentSize: CGSize = .zero
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text(sampleBody)
                    .foregroundStyle(.white).opacity(0.9)
                    .background(
                        GeometryReader { geo -> Color in
                            DispatchQueue.main.async {
                                scrollViewContentSize = geo.size
                            }
                            return Color.clear
                        }
                    )
                HStack {
                    Spacer()
                    Button {
                        print("toolbar button")
                    } label: {
                        Image(systemName: "pencil")
                            .foregroundStyle(.white)
                    }
                    .frame(alignment: .bottomTrailing)
                }
                .padding([.bottom], 0)
            }
            
        }.frame(
            maxHeight: scrollViewContentSize.height
        )
    }
}

