//
//  RatioHorizonalStack.swift
//
//
//  Created by Kristóf Kálai on 10/11/2023.
//

import AdvancedGeometryReader
import SwiftUI

public struct RatioHorizonalStack<Leading: View, Trailing: View> {
    public enum Ratio {
        case left(CGFloat)

        fileprivate var leftRatio: CGFloat {
            switch self {
            case let .left(leftRatio): return leftRatio
            }
        }

        public static func right(_ ratio: CGFloat) -> Self {
            .left(1 - ratio)
        }

        public static var equal: Self {
            .left(0.5)
        }
    }
    private let ratio: Ratio
    private let spacing: CGFloat
    private let leading: Leading
    private let trailing: Trailing

    public init(
        ratio: Ratio = .equal,
        spacing: CGFloat = .zero,
        @ViewBuilder leading: @escaping () -> Leading,
        @ViewBuilder trailing: @escaping () -> Trailing
    ) {
        self.ratio = ratio
        self.spacing = spacing
        self.leading = leading()
        self.trailing = trailing()
    }
}

extension RatioHorizonalStack: View {
    public var body: some View {
        ContentWrappingGeometryReader { proxy in
            HStack(spacing: spacing) {
                leading
                    .frame(width: (proxy.size.width - spacing) * ratio.leftRatio)
                trailing
            }
        }
    }
}
