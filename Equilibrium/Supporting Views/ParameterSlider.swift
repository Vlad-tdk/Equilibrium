//
//  ParameterSlider.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 26.10.24..
//

import SwiftUI

struct ParameterSlider: View {
    @Binding var value: CGFloat
    let range: ClosedRange<CGFloat>
    let title: LocalizedStringKey
    
    var body: some View {
        VStack(alignment: .leading) {
            (Text(title) + Text(": ") + Text(value, format: .number.precision(.fractionLength(2))))
                .foregroundColor(.white)
            Slider(value: $value, in: range)
        }
    }
}
#Preview {
    ParameterSlider(value: .constant(0), range: 0...1, title: "Title")
}
