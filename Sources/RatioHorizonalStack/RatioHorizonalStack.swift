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

    public enum SpacingType {
        case leading
        case middle
        case trailing

        public static var `default`: Self {
            .middle
        }
    }

    private let ratio: Ratio
    private let spacing: CGFloat
    private let spacingType: SpacingType
    private let leading: Leading
    private let trailing: Trailing

    public init(
        ratio: Ratio = .equal,
        spacing: CGFloat = .zero,
        occupySpacingFrom spacingType: SpacingType = .default,
        @ViewBuilder leading: @escaping () -> Leading,
        @ViewBuilder trailing: @escaping () -> Trailing
    ) {
        self.ratio = ratio
        self.spacing = spacing
        self.spacingType = spacingType
        self.leading = leading()
        self.trailing = trailing()
    }
}

extension RatioHorizonalStack: View {
    public var body: some View {
        ContentWrappingGeometryReader { proxy in
            HStack(spacing: spacing) {
                let halfWidth = proxy.size.width * ratio.leftRatio
                let spacingOccupiedSpaceInLeadingPart: CGFloat = {
                    switch spacingType {
                    case .leading: spacing
                    case .middle: spacing / 2
                    case .trailing: .zero
                    }
                }()
                leading
                    .frame(width: halfWidth - spacingOccupiedSpaceInLeadingPart)
                trailing
            }
        }
    }
}
