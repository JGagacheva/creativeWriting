//
//  ExpandinView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/21/24.
//  MARK: This view representes the part of the note that is displayed after the note is expanded. It also contains the menu that displays when the ellipsis button is clicked.

import SwiftUI

protocol Delegate {
    func deletemeh()
    func editMe()
}

struct ExpandedView: View {
    @State private var scrollViewContentSize: CGSize = .zero
    
    let sampleBody: String
    let delegate: Delegate?
    
    init(_ sampleBody: String, delegate: Delegate? = nil) {
        self.sampleBody = sampleBody
        self.delegate = delegate
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
                OptionsMenuView(delegate: delegate)
                    .frame(alignment: .bottomTrailing)
            }
            .padding([.top], 4)
        }
    }
}

