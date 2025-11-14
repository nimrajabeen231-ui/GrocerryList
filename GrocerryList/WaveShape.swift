//
//  WaveShape.swift
//  GrocerryList
//
//  Created by Nimra Jabeen on 11/11/25.
//


/*
import SwiftUI

struct WaveShape: Shape {
    var offset: CGFloat // To allow animation of the wave's position

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Start at the bottom-left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        // Move up to the start of the wavy section
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY + offset))

        // --- First Half of the Wave (Downward Curve) ---
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.midY + offset + 50), // Middle point (dips lower)
            control: CGPoint(x: rect.midX / 2, y: rect.midY + offset * 0.5) // Control point to start the dip
        )
        
        // --- Second Half of the Wave (Upward Curve) ---
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.midY - offset), // End point (rises higher)
            control: CGPoint(x: rect.midX * 1.5, y: rect.midY + offset * 1.5) // Control point to create the peak
        )

        // Close the shape
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Move down to bottom-right
        path.closeSubpath()

        return path
    }
}
*/





import SwiftUI

struct WaveShape: Shape {
    var offset: CGFloat // To allow animation of the wave's position

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Start at the bottom-left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        // Move up to the start point of the curve (slightly above center)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY + offset))

        // --- Create a smooth, flowing Cubic Bézier Curve (S-wave) ---
        path.addCurve(
            to: CGPoint(x: rect.maxX, y: rect.midY - offset), // End point (rises on the right side)
            
            // Control Point 1: Pulls the curve down near the left side
            control1: CGPoint(x: rect.midX / 2, y: rect.midY + offset * 1.5),
            
            // Control Point 2: Pulls the curve up near the right side
            control2: CGPoint(x: rect.midX * 1.5, y: rect.midY - offset * 0.5)
        )

        // Close the shape
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Move down to bottom-right
        path.closeSubpath()

        return path
    }
}
