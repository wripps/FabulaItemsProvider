//
//  P4_FlaredCircle.swift
//  Fabula
//
//  Created by jasu on 2021/09/06.
//  Copyright (c) 2021 jasu All rights reserved.
//

import SwiftUI

public struct P4_FlaredCircle: View {
    
    let spacing: CGFloat = 20
    
    public init() {}
    public var body: some View {
        HStack(spacing: spacing) {
            VStack(spacing: spacing) {
                getView("1")
                getView("2")
            }
            HStack(spacing: spacing) {
                VStack(spacing: spacing) {
                    getView("3")
                    getView("4")
                }
                getView("5")
            }
        }
        .padding(.vertical, spacing * 3)
        .padding(.horizontal, spacing)
    }
    
    private func getView(_ text: String) -> some View {
        FlaredCircle {
            Text(text)
                .font(.title2)
                .foregroundColor(Color.fabulaFore1)
        }
    }
}

fileprivate
struct FlaredCircle<Content>: View where Content: View {
    var backgroundColor: Color = Color(hex: 0x232834).opacity(0.8)
    var intensity: CGFloat = 0.5
    var gradient = Gradient(colors: [
        Color.white,
        Color(hex: 0xA85F89),
        Color(hex: 0xA85F89).opacity(0)
    ])
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
                .overlay(
                    GeometryReader { proxy in
                        ZStack(alignment: .topLeading) {
                            LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
                                .mask(
                                    Circle()
                                )
                                .opacity(0.12)
                            
                            LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
                                .mask(
                                    Circle()
                                        .strokeBorder(lineWidth: 1)
                                )
                                .opacity(0.6)
                        }
                        .mask(
                            LinearGradient(gradient: Gradient(colors: [
                                Color.black,
                                Color.black.opacity(0),
                                Color.black.opacity(0)
                            ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        
                    }
                        .opacity(intensity)
                )
            content()
        }
    }
}

struct P4_FlaredCircle_Previews: PreviewProvider {
    static var previews: some View {
        P4_FlaredCircle().preferredColorScheme(.dark)
    }
}
