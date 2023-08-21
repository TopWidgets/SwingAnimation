//
//  SwingAnimationModifier.swift
//  SwingAnimation
//
//  Created by Octree on 2023/3/16.
//
//  Copyright (c) 2023 Octree <fouljz@gmail.me>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import ClockHandRotationKit
import SwiftUI

/// A modifier that applies a swing animation to a view.
public struct SwingAnimationModifier: ViewModifier {
    /// The duration of the animation.
    public let duration: CGFloat

    /// The direction of the swing animation.
    public let direction: Direction

    /// The distance of the swing animation.
    public let distance: CGFloat

    /// Creates a swing animation modifier with the specified duration, direction, and distance.
    /// - Parameters:
    ///   - duration: The duration of the animation.
    ///   - direction: The direction of the swing animation.
    ///   - distance: The distance of the swing animation.
    public init(duration: CGFloat, direction: Direction, distance: CGFloat) {
        self.duration = duration
        self.direction = direction
        self.distance = distance
    }

    private var alignment: Alignment {
        if direction == .vertical {
            return distance > 0 ? .top : .bottom
        } else {
            return distance > 0 ? .leading : .trailing
        }
    }

    @ViewBuilder
    private func overlayView(content: Content) -> some View {
        let alignment = alignment
        GeometryReader {
            let size = $0.size
            let extendLength = direction == .vertical ? size.height : size.width
            let length: CGFloat = abs(distance) + extendLength
            let innerDiameter = (length + extendLength) / 2
            let outerAlignment: Alignment = {
                if direction == .vertical {
                    return distance > 0 ? .bottom : .top
                } else {
                    return distance > 0 ? .trailing : .leading
                }
            }()

            ZStack(alignment: outerAlignment) {
                Color.clear
                ZStack(alignment: alignment) {
                    Color.clear
                    ZStack(alignment: alignment) {
                        Color.clear
                        content.clockHandRotationEffect(period: .custom(duration))
                    }
                    .frame(width: innerDiameter, height: innerDiameter)
                    .clockHandRotationEffect(period: .custom(-duration / 2))
                }
                .frame(width: length, height: length)
                .clockHandRotationEffect(period: .custom(duration))
            }
            .frame(width: size.width, height: size.height, alignment: alignment)
        }
    }

    public func body(content: Content) -> some View {
        content.hidden()
            .overlay(overlayView(content: content))
    }
}
