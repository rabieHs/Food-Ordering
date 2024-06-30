//
//  LoadingView.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 29/6/2024.
//

import Foundation
import SwiftUI

struct ActivityIndecator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndecatorView = UIActivityIndicatorView(style: .large)
        activityIndecatorView.color = .primaryColor
        activityIndecatorView.startAnimating()
        return activityIndecatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    
    
}
struct LoadingView : View {
    var body: some View {
        ZStack{
            Color(.systemBackground).ignoresSafeArea()
            ActivityIndecator()
        }
    }
}
