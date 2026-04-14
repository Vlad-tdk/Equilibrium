//
//  ColorPickerRow.swift
//  Equilibrium
//

import SwiftUI

// MARK: - Color Picker Row
// Uses a swatch grid instead of ColorPicker (UIColorWell) to avoid
// the _UIReparentingView warning when embedded inside a sheet.

struct ColorPickerRow: View {
    let title: String
    @Binding var color: Color
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.cyan)
                    .frame(width: 24)
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                Spacer()
                // Preview swatch
                Circle()
                    .fill(color)
                    .frame(width: 24, height: 24)
                    .overlay(Circle().stroke(Color.white.opacity(0.4), lineWidth: 1))
            }

            SwatchGrid(selected: $color, swatches: swatches(for: icon))
        }
    }

    private func swatches(for icon: String) -> [Color] {
        if icon == Icons.rectangle {
            // Background presets — dark tones
            return [
                Color(hex: "1a1a2e"),
                Color(hex: "0d1b2a"),
                Color(hex: "0d3b35"),
                Color(hex: "1a2e1a"),
                Color(hex: "2d1b69"),
                Color(hex: "1a0a2e"),
                Color(hex: "2e1a0a"),
                Color(hex: "0a0a0a"),
            ]
        } else {
            // Circle presets — vibrant tones
            return [
                Color.white,
                Colors.Palette.cyan,
                Color(hex: "4dd0e1"),
                Color(hex: "a78bfa"),
                Color(hex: "f472b6"),
                Color(hex: "34d399"),
                Color(hex: "fbbf24"),
                Color(hex: "fb7185"),
            ]
        }
    }
}

// MARK: - Swatch Grid

private struct SwatchGrid: View {
    @Binding var selected: Color
    let swatches: [Color]

    var body: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 8),
            spacing: 8
        ) {
            ForEach(swatches.indices, id: \.self) { i in
                let swatch = swatches[i]
                Button {
                    selected = swatch
                } label: {
                    Circle()
                        .fill(swatch)
                        .frame(height: 28)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: isSelected(swatch) ? 2 : 0)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.25), lineWidth: isSelected(swatch) ? 0 : 0.5)
                        )
                        .scaleEffect(isSelected(swatch) ? 1.15 : 1.0)
                        .animation(.spring(response: 0.2), value: isSelected(swatch))
                }
            }
        }
    }

    private func isSelected(_ swatch: Color) -> Bool {
        // Compare by resolved UIColor
        UIColor(selected) == UIColor(swatch)
    }
}
