//
//  ExpandinView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/21/24.
//

import SwiftUI

struct ExpandedView: View {
    @State private var scrollViewContentSize: CGSize = .zero
    
    let sampleBody: String
    
    init(_ sampleBody: String) {
        self.sampleBody = sampleBody
    }
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Text(sampleBody)
                    .foregroundStyle(.white).opacity(0.9)
                    .background(
                        GeometryReader { geo -> Color in
                            DispatchQueue.main.async {
                                scrollViewContentSize = geo.size
                            }
                            return Color.clear
//                            return Color.green
                        }
                    )
                 
            }.frame(maxHeight: scrollViewContentSize.height)
            HStack {
                Spacer()
                OptionsView().frame(alignment: .bottomTrailing)
                /*
                Button {
                    print("delete button")
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.white)
                }
                .frame(alignment: .bottomTrailing)
                 */
            }
            .padding([.top], 4)
        }
    }
}

struct OptionsView: View {
    var body: some View {
        Menu {
            Button("Delete", action: {})
            Button("Edit", action: {})
        } label: {
            Label("", systemImage: "ellipsis")
                .foregroundStyle(.white)
        }
    }
}

