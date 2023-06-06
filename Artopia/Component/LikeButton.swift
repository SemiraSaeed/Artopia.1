//
//  SwiftUIView.swift
//  Artopia
//
//  Created by Samira Omer on 06/04/2023.
//

import SwiftUI

struct LikeButton: View {
  
   
   
    @State var isLiked = false
    
    
    var body: some View {
        Button{
            self.isLiked.toggle()
//            LikeManager.addToLikes(item: item )
        }
     label: {
        ZStack {
            image(Image(systemName: "heart.fill"), show: isLiked)
            image(Image (systemName: "heart"), show: !isLiked)
        }
    }
}
    func image(_ image: Image, show: Bool) -> some View {
        image
            .tint(isLiked ? .red : .black)
            .font (.title).fontWeight(.semibold)
            .scaleEffect(show ? 1 : 0)
            .opacity(show ? 1 : 0)
    
            .animation(.interpolatingSpring(stiffness: 170, damping:
        15), value: show)
            
        }
}


struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton()
    }
}
