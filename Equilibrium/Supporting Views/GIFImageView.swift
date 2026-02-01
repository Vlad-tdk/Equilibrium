//
//  GIFImageView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI
import UIKit

struct GIFImageView: UIViewRepresentable {
    let gifName: String
    var contentMode: UIView.ContentMode = .scaleAspectFill
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = contentMode
        imageView.clipsToBounds = true
        
        // Load GIF using existing extension
        imageView.loadGif(name: gifName)
        
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        // Reload if gif name changes
        uiView.loadGif(name: gifName)
        uiView.contentMode = contentMode
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color.black
        GIFImageView(gifName: "fire1")
            .frame(width: 300, height: 400)
    }
}
