//
//  RemoteImage.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 30/6/2024.
//

import Foundation
import SwiftUI

final class ImageLoader : ObservableObject {
    
   @Published var image : Image? = nil
    
    
    
    func loadImage(from urlString: String){
        NetworkManager.shared.downloadImage(from: urlString) { image in
            guard let image = image else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: image)

            }
        }
    }
    
}

struct RemoteImage : View {
    var image : Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
            
    }
}

struct AppetizerRemoteImage: View {
    let urlString: String
    

    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.loadImage(from: urlString)
            }
    }
}
