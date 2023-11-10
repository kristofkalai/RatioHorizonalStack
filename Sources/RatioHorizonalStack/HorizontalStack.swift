//
//  HorizontalStack.swift
//
//
//  Created by Kristóf Kálai on 10/11/2023.
//

import SwiftUI

public struct HorizontalStack<Content: View> {
    private let columns: Int
    private let spacing: CGFloat?
    private let alignment: VerticalAlignment?
    @ViewBuilder private let content: () -> Content

    public init(
        columns: Int,
        spacing: CGFloat? = .zero,
        alignment: VerticalAlignment? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.columns = columns
        self.spacing = spacing
        self.alignment = alignment
        self.content = content
    }
}

extension HorizontalStack: View {
    public var body: some View {
        Grid(horizontalSpacing: spacing, verticalSpacing: .zero) {
            GridRow {
                ForEach(0..<columns, id: \.self) { _ in
                    Color.clear
                        .frame(maxHeight: 0)
                }
            }
            GridRow(alignment: alignment, content: content)
        }
    }
}
